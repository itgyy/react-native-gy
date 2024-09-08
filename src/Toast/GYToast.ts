import { NativeModules } from 'react-native';
const manager = NativeModules.GYToast;

const GYToast = {
  /**
   * Toast
   * @returns
   */
  show(msg: string) {
    return manager.show(msg);
  },
};
export default GYToast;
