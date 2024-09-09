import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { GYScrollView } from 'react-native-gy';

export default function RefreshPage() {
  const [isRefreshing, setIsRefreshing] = React.useState(false);

  return (
    <View>
      <GYScrollView
        enableMJRefresh={true}
        mjRefreshing={isRefreshing}
        onMJRefresh={() => {
          setIsRefreshing(true);
          setTimeout(() => {
            setIsRefreshing(false);
          }, 5000);
        }}
        style={{ height: 300, backgroundColor: '#ffffff', width: '100%' }}
      >
        <Text>测试哈哈哈哈</Text>
      </GYScrollView>
    </View>
  );
}

const styles = StyleSheet.create({});
