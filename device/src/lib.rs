pub mod app_delete;
pub mod app_download;
pub mod app_update;
pub mod auth_code_storage;
pub mod device_binding;
pub mod device_cert_check;
pub mod se_activate;
pub mod se_query;
pub mod se_secure_check;
extern crate common;
pub mod cos_upgrade;
pub mod device_manager;
pub mod deviceapi;
pub mod key_manager;
pub mod manager;
#[macro_use]
extern crate lazy_static;
extern crate mq;
pub mod error;
#[macro_use]
extern crate failure;
use core::result;
pub type Result<T> = result::Result<T, failure::Error>;
use crate::error::ImkeyError;
use common::constants;
use serde::{Deserialize, Serialize};

pub mod cos_check_update;

#[allow(non_snake_case)]
#[derive(Serialize, Deserialize, Debug, Clone)]
pub struct ServiceResponse<T> {
    pub _ReturnCode: String,
    pub _ReturnMsg: String,
    pub _ReturnData: T,
}

pub trait TsmService {
    type ReturnData;
    fn send_message(&mut self) -> Result<Self::ReturnData>;
}

impl<T> ServiceResponse<T> {
    pub fn service_res_check(&self) -> Result<()> {
        match self._ReturnCode.as_str() {
            constants::TSM_RETURN_CODE_SUCCESS => Ok(()),
            constants::TSM_RETURNCODE_APP_DELETE_FAIL => {
                Err(ImkeyError::ImkeyTsmAppDeleteFail.into())
            }
            constants::TSM_RETURNCODE_DEVICE_ILLEGAL => {
                Err(ImkeyError::ImkeyTsmDeviceIllegal.into())
            }
            constants::TSM_RETURNCODE_OCE_CERT_CHECK_FAIL => {
                Err(ImkeyError::ImkeyTsmOceCertCheckFail.into())
            }
            constants::TSM_RETURNCODE_DEVICE_STOP_USING => {
                Err(ImkeyError::ImkeyTsmDeviceStopUsing.into())
            }
            constants::TSM_RETURNCODE_RECEIPT_CHECK_FAIL => {
                Err(ImkeyError::ImkeyTsmReceiptCheckFail.into())
            }
            constants::TSM_RETURNCODE_DEV_INACTIVATED => {
                Err(ImkeyError::ImkeyTsmDeviceNotActivated.into())
            }
            constants::TSM_RETURNCODE_APP_DOWNLOAD_FAIL => {
                Err(ImkeyError::ImkeyTsmAppDownloadFail.into())
            }
            constants::TSM_RETURNCODE_AUTH_CODE_HANDLE_FAIL => {
                Err(ImkeyError::ImkeyTsmAuthCodeCiphertextStorageFail.into())
            }
            constants::TSM_RETURNCODE_COS_CHECK_UPDATE_FAIL => {
                Err(ImkeyError::ImkeyTsmCosCheckUpdateFail.into())
            }
            constants::TSM_RETURNCODE_COS_INFO_NO_CONF => {
                Err(ImkeyError::ImkeyTsmCosInfoNoConf.into())
            }
            constants::TSM_RETURNCODE_COS_UPGRADE_FAIL => {
                Err(ImkeyError::ImkeyTsmCosUpgradeFail.into())
            }
            constants::TSM_RETURNCODE_UPLOAD_COS_VERSION_IS_NULL => {
                Err(ImkeyError::ImkeyTsmUploadCosVersionIsNull.into())
            }
            constants::TSM_RETURNCODE_SWITCH_BL_STATUS_FAIL => {
                Err(ImkeyError::ImkeyTsmSwitchBlStatusFail.into())
            }
            constants::TSM_RETURNCODE_WRITE_WALLET_ADDRESS_FAIL => {
                Err(ImkeyError::ImkeyTsmWriteWalletAddressFail.into())
            }
            constants::TSM_RETURNCODE_DEVICE_CHECK_FAIL => {
                Err(ImkeyError::ImkeyTsmDeviceAuthenticityCheckFail.into())
            }
            constants::TSM_RETURNCODE_DEVICE_ACTIVE_FAIL => {
                Err(ImkeyError::ImkeyTsmDeviceActiveFail.into())
            }
            constants::TSM_RETURNCODE_SEID_ILLEGAL => Err(ImkeyError::ImkeyTsmDeviceIllegal.into()),
            constants::TSM_RETURNCODE_SE_QUERY_FAIL => {
                Err(ImkeyError::ImkeyTsmDeviceUpdateCheckFail.into())
            }
            _ => Err(ImkeyError::ImkeyTsmServerError.into()),
        }
    }
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
