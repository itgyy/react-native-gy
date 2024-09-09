import { NativeModules } from 'react-native';
const manager = NativeModules.GYToast;

enum GYToastDuration {
  SHORT = 0,
  LONG = 1,
}

const GYToast = {
  /**
   * Toast
   * @returns
   */
  show(msg: string, duration?: GYToastDuration) {
    if (duration) {
      return manager.show(msg, duration);
    } else {
      return manager.show(msg, GYToastDuration.SHORT);
    }
  },
};
export {GYToastDuration};
export default GYToast;
