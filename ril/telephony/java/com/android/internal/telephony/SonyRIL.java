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
import android.os.SystemProperties;
import android.telephony.Rlog;

/**
 * RIL customization for Xperia Z3 DUAL
 * <p/>
 * {@hide}
 */
public class SonyRIL extends RIL {
    private static final String SONYRIL_LOG_TAG = "SonyRIL";
    private static final boolean SONYRIL_LOGD = false;

    private boolean mIsGsm = false;

    public SonyRIL(Context context, int preferredNetworkType, int cdmaSubscription) {
        super(context, preferredNetworkType, cdmaSubscription, null);

        mQANElements = SystemProperties.getInt("ro.ril.telephony.mqanelements", 5);
    }

    public SonyRIL(Context context, int preferredNetworkType,
                   int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);

        mQANElements = SystemProperties.getInt("ro.ril.telephony.mqanelements", 5);
    }

    @Override
    public void setPhoneType(int phoneType) {
        super.setPhoneType(phoneType);
        mIsGsm = (phoneType != RILConstants.CDMA_PHONE);
    }

    private void sonyRilLog(String msg) {
        Rlog.d(SONYRIL_LOG_TAG, msg
                + (mInstanceId != null ? (" [SUB" + mInstanceId + "]") : ""));
    }
}
