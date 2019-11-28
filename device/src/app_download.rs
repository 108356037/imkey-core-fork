extern crate reqwest;

use std::collections::HashMap;
use reqwest::{Client, Response, Result};
use serde::{Serialize, Deserialize};
use common::http;

#[derive(Debug, Serialize, Deserialize)]
pub struct app_download_request{
    pub seid : String,
    pub instanceAid : String,
    pub deviceCert : String,
    pub sdkVersion : Option<String>,
    pub stepKey : String,
    pub statusWord : Option<String>,
    pub commandID : String,
    pub cardRetDataList : Option<Vec<String>>,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct service_response {
    pub _ReturnCode: String,
    pub _ReturnMsg: String,
    pub _ReturnData: app_download_response,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct app_download_response{
    pub seid : Option<String>,
    pub instanceAid : Option<String>,
    pub nextStepKey : Option<String>,
    pub apduList : Option<Vec<String>>,
}

impl app_download_request{
    pub fn build_request_data(seid : String, instance_aid : String, device_cert : String, sdk_version : Option<String>) -> app_download_request{
        app_download_request{
            seid : seid,
            instanceAid : instance_aid,
            deviceCert : device_cert,
            sdkVersion : sdk_version,
            stepKey : String::from("01"),
            statusWord : None,
            commandID : String::from("appDownload"),
            cardRetDataList : None,
        }
    }


    pub fn app_download(&mut self){
        loop {
            let mut response_data : Response = http::post("appDownload", &self);
            let return_bean: service_response = response_data.json().unwrap();
            if return_bean._ReturnCode == "000000"{
                //判断步骤key是否已经结束
                let next_step_key = return_bean._ReturnData.nextStepKey.unwrap();
                if "end".eq(next_step_key.as_str()) {
                    println!("应用下载成功结束");
                    break;
                }

                let mut apdu_res: Vec<String> = Vec::new();
                
                match return_bean._ReturnData.apduList{
                    Some(apdu_list) => {
                        for (index_val, apdu_val) in apdu_list.iter().enumerate(){
                            //调用发送指令接口，并获取执行结果
                            println!("download apdu --> {}", apdu_val);
                            let status_word = "9000";
                            

                            if "02".eq(next_step_key.as_str()) {
                                apdu_res.push(String::from("9000"));
                                apdu_res.push(String::from("5F49410465330B2F12ADEC9D6C61CA1768704261D02E5F39177762D5C457F0FDA4ABC87882ADD11C951941C003269874103F5C83269C3CF7A61231D2C746F4AE543D382F86100C1402F7FC4E1C3C1BD35674431261289000"));
                            }else{
                                apdu_res.push(String::from(status_word));
                            }

                            //如果指令执行失败，则停止执行并返回
                            if "03".eq(next_step_key.as_str()) && index_val > 0 && !"9000".eq(status_word){
                                println!("下载指令执行失败");
                                break;
                            }else if index_val == apdu_list.len() - 1 {
                                self.statusWord = Some(String::from(status_word));
                            }
                        }
                        self.cardRetDataList = Some(apdu_res);
                        self.stepKey = next_step_key;
                    },
                    None => (),
                }
            }else{
                println!("应用服务器执行失败并返回 : {}", return_bean._ReturnMsg);
                break;
            }
        }
    }
}


////http请求
//// mod constants;
//fn post<T : Serialize>(action: &str, req_data: &T) -> Response{
//   // let url: String = constants::URL.to_string() + action;
//    let mut url = String::from("http://localhost:8080/imkey/");
//    url.push_str(action);
//    let client = reqwest::Client::new();
//    let response: Response = client.post(&*url)
//        .json(&req_data)
//        .send().unwrap();
//    response
//}