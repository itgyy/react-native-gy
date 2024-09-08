import { useState, useEffect, useRef, useMemo } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import {
  GYFile,
  GYToast,
  GYHud,
  GYPhotoBrowser,
  type GYPhotoBrowserAction,
} from 'react-native-gy';

export default function App() {
  const photpBrowser = useRef<GYPhotoBrowserAction>(null);
  const imgs = useMemo(() => {
    return [
      {
        url: 'https://n1.itc.cn/img8/wb/recom/2016/08/28/147234686090676539.JPEG',
        videoUrl: '',
      },
      {
        url: 'https://img1.baidu.com/it/u=2693733305,4035903587&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1200',
        videoUrl: '',
      },
      {
        url: 'https://img1.baidu.com/it/u=2693733305,4035903587&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1200',
        videoUrl: 'https://v-cdn.zjol.com.cn/276982.mp4',
      },
    ];
  }, []);
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
          GYToast.show('xxxxxx', 1.5);
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

      <TouchableOpacity
        style={styles.btn}
        onPress={() => {
          photpBrowser.current?.show();
        }}
      >
        <Text>图片浏览器</Text>
      </TouchableOpacity>

      <GYPhotoBrowser ref={photpBrowser} datas={imgs} index={0} />
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
