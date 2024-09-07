import { NativeModules } from 'react-native';
const manager = NativeModules.GYHud;

const GYHud = {
  /**
   * Hud
   * @returns
   */
  show(status?:string) {
    if(status && status.length != 0){
        return manager.showStatus(status);
    }else{
        return manager.show();
    }
  },
  dismiss(){
    return manager.dismiss();
  }
};
export default GYHud;
