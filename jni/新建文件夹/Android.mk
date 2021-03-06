LOCAL_PATH := $(call my-dir)

include_path := $(call my-dir)/inc  

include $(CLEAR_VARS)
LOCAL_MODULE := pw_net_sdk
LOCAL_SRC_FILES := ./pwnetsdk/libpwnetsdk.a

include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := _json
LOCAL_SRC_FILES := ./pwpriprotocol/exchange/lib/libjson.a

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := _exchange
LOCAL_SRC_FILES := ./pwpriprotocol/exchange/lib/libexchange.a

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := pw_pri_proto
LOCAL_CPPFLAGS += -std=c++11
LOCAL_C_INCLUDES := $(include_path)
LOCAL_SRC_FILES := ./pwpriprotocol/APTcpConnect.cpp\
                 ./pwpriprotocol/priprotocol.cpp\
		./pwpriprotocol/APUdpBroadcast.cpp\
		./pwpriprotocol/ApUdpBroadcastset.cpp\

LOCAL_STATIC_LIBRARIES:= _json\
		_exchange

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := _montagplay
LOCAL_SRC_FILES := ./gl_montage_play_lib/libmontage_play.so
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := tpnsSecurity
LOCAL_SRC_FILES := ./xgnative/libtpnsSecurity.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := tpnsWatchdog
LOCAL_SRC_FILES := ./xgnative/libtpnsWatchdog.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := JniHelper
LOCAL_SRC_FILES := ./jniHelper/libJniHelper.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := _montagshow
LOCAL_SRC_FILES := ./gl_montage_play_lib/libpw_magic_show_2.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := _streamReader
LOCAL_SRC_FILES := ./gl_montage_play_lib/libStreamReader.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := pwnetsdk
LOCAL_C_INCLUDES := $(include_path)
LOCAL_CPPFLAGS += -std=c++11
LOCAL_SRC_FILES := ipc365_app_showmo_jni_jniclient.cpp\
                   ./avi/aviconvert.cpp\
                   ./h264parse/h264parse.cpp\
                   ./h264parse/h264sps.cpp\
                   ./StreamAdapter.cpp\
			
LOCAL_LDLIBS := -llog 
LOCAL_STATIC_LIBRARIES:= pw_net_sdk\
			pw_pri_proto\
			JniHelper

LOCAL_SHARED_LIBRARIES:= _montagplay\
			_montagshow\
			_streamReader
include $(BUILD_SHARED_LIBRARY)