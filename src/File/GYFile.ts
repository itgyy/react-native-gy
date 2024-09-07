import { NativeModules } from 'react-native';
const manager = NativeModules.GYFile;

const GYFile = {
  /**
   * 打开系统文件管理器
   * @returns
   */
  openSystemFileManager() {
    return manager.openSystemFileManager();
  },
};
export default GYFile;
