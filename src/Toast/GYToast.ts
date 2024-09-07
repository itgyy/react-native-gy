import { NativeModules } from 'react-native';
const manager = NativeModules.GYToast;

const GYToast = {
  /**
   * Toast
   * @returns
   */
  show(msg: string, duration: number) {
    return manager.show(msg, duration);
  },
};
export default GYToast;
