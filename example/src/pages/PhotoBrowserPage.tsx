import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import React, { useMemo, useRef } from 'react';
import { GYPhotoBrowser, type GYPhotoBrowserAction } from 'react-native-gy';

export default function PhotoBrowserPage() {
  const photpBrowser = useRef<GYPhotoBrowserAction>(null);
  const imgs = useMemo(() => {
    return [
      // {
      //   url: 'https://n1.itc.cn/img8/wb/recom/2016/08/28/147234686090676539.JPEG',
      //   videoUrl: '',
      // },
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

  return (
    <View>
      <TouchableOpacity
        style={styles.btn}
        onPress={() => {
          photpBrowser.current?.show();
        }}
      >
        <Text>显示</Text>
      </TouchableOpacity>
      <GYPhotoBrowser ref={photpBrowser} datas={imgs} index={0} />
    </View>
  );
}

const styles = StyleSheet.create({
  btn: {
    height: 50,
    backgroundColor: '#ffffff',
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 10,
    margin: 15,
  },
});
