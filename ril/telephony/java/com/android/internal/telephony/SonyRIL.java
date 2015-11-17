/*
 * Copyright (c) 2014, The CyanogenMod Project. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import android.content.Context;
import android.os.Message;
import android.os.Parcel;
import android.os.SystemProperties;
import android.telephony.Rlog;
import android.telephony.SignalStrength;

import java.util.Arrays;

/**
 * RIL customization for Xperia Z3 DUAL
 * <p/>
 * {@hide}
 */
public class SonyRIL extends RIL {
    private static final int MAX_RILS = 2;
    private static final int[] RIL_NETWORK_TYPE = new int[MAX_RILS];

    private static final String SONYRIL_LOG_TAG = "SonyRIL";
    private static final boolean SONYRIL_LOGD = false;

    private boolean mIsGsm = false;

    public SonyRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription, null);

        mQANElements = SystemProperties.getInt("ro.ril.telephony.mqanelements", 5);
    }

    public SonyRIL(Context context, int preferredNetworkType,
                   int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);

        processRILPreferredNetworkType(mInstanceId, preferredNetworkType);
        mQANElements = SystemProperties.getInt("ro.ril.telephony.mqanelements", 5);
    }

    @Override
    public void setPhoneType(int phoneType) {
        super.setPhoneType(phoneType);
        mIsGsm = (phoneType != RILConstants.CDMA_PHONE);
    }

    @Override
    protected Object
    responseSignalStrength(Parcel p) {
        int gsmSignalStrength = p.readInt();
        int gsmBitErrorRate = p.readInt();
        int umtsRscp = p.readInt(); // not used by stock SignalStrength
        int cdmaDbm = p.readInt();
        int cdmaEcio = p.readInt();
        int evdoDbm = p.readInt();
        int evdoEcio = p.readInt();
        int evdoSnr = p.readInt();
        int lteSignalStrength = p.readInt();
        int lteRsrp = p.readInt();
        int lteRsrq = p.readInt();
        int lteRssnr = p.readInt();
        int lteCqi = p.readInt();
        int tdScdmaRscp = p.readInt();
        boolean isGsm = p.readInt() != 0;

        // constructor sets default true, makeSignalStrengthFromRilParcel does not set it
        return new SignalStrength(gsmSignalStrength, gsmBitErrorRate, cdmaDbm, cdmaEcio, evdoDbm,
                evdoEcio, evdoSnr, lteSignalStrength, lteRsrp, lteRsrq, lteRssnr, lteCqi,
                tdScdmaRscp, mIsGsm);
    }

    @Override
    protected Object responseGetPreferredNetworkType(Parcel p) {
        Object o = super.responseGetPreferredNetworkType(p);

        processRILPreferredNetworkType(mInstanceId, mPreferredNetworkType);

        return o;
    }

    @Override
    public void setPreferredNetworkType(int networkType, Message response) {
        super.setPreferredNetworkType(networkType, response);

        processRILPreferredNetworkType(mInstanceId, networkType);
    }

    private void sonyRilLog(String msg) {
        Rlog.d(SONYRIL_LOG_TAG, msg
                + (mInstanceId != null ? (" [SUB" + mInstanceId + "]") : ""));
    }

    private void logNetworkType() {
        if (!SONYRIL_LOGD) return;

        sonyRilLog("responseGetPreferredNetworkType: networkType=" +
                String.valueOf(mPreferredNetworkType));

        sonyRilLog("responseGetPreferredNetworkType: RIL_NETWORK_TYPE=" +
                Arrays.toString(RIL_NETWORK_TYPE));

        sonyRilLog("gsm.network.type=" +
                Arrays.toString(RIL_NETWORK_TYPE));
    }

    private void processRILPreferredNetworkType(Integer instanceId, int type) {
        if (instanceId != null) {
            RIL_NETWORK_TYPE[instanceId] = type;
        }

        SystemProperties.set("persist.radio.prefer.network", String.valueOf(RIL_NETWORK_TYPE[0]));
        SystemProperties.set("persist.radio.prefer.nw.sub", String.valueOf(RIL_NETWORK_TYPE[1]));

        logNetworkType();
    }
}
