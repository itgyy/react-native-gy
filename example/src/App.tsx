import { useState, useEffect } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { GYFile ,GYToast,GYHud} from 'react-native-gy';

export default function App() {
  useEffect(() => {}, []);

  return (
    <View style={styles.container}>
      <TouchableOpacity
        style={styles.btn}
        onPress={() => {
          GYFile.openSystemFileManager();
        }}
      >
        <Text>打开文件管理器</Text>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.btn}
        onPress={() => {
          GYToast.show('xxxxxx',1.5);
        }}
      >
        <Text>Toast</Text>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.btn}
        onPress={() => {
          GYHud.show('正在加载中...');
          setTimeout(() => {
            GYHud.dismiss();
          }, 4000);
        }}
      >
        <Text>Hud</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  btn: {
    padding: 10,
  },
});
