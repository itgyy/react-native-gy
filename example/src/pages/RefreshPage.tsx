import React from 'react';
import { FlatList, ScrollView, StyleSheet, Text, View } from 'react-native';
import { GYScrollView } from 'react-native-gy';

export default function RefreshPage() {
  const [isRefreshing, setIsRefreshing] = React.useState(false);

  return (
    <View style={{ padding: 10 }}>
      <Text style={styles.title}>ScrollView</Text>
      <GYScrollView
        enableGYRefresh={true}
        refreshing={isRefreshing}
        onGYRefresh={() => {
          console.log('开始刷新');
          setIsRefreshing(true);
          setTimeout(() => {
            console.log('结束刷新');
            setIsRefreshing(false);
          }, 5000);
        }}
        style={{
          height: 200,
          backgroundColor: '#fff',
          width: '100%',
        }}
      >
        <Text>测试哈哈哈哈</Text>
      </GYScrollView>

      <FlatList
        style={{ height: 200, marginTop: 10, backgroundColor: '#fff' }}
        data={[1, 2, 3]}
        renderScrollComponent={(props) => (
          <GYScrollView
            {...props}
            enableGYRefresh={true}
            refreshing={isRefreshing}
            onGYRefresh={() => {
              console.log('开始刷新');
              setIsRefreshing(true);
              setTimeout(() => {
                console.log('结束刷新');
                setIsRefreshing(false);
              }, 5000);
            }}
          />
        )}
        renderItem={() => (
          <View style={{ height: 10, backgroundColor: 'red' }}></View>
        )}
      ></FlatList>
    </View>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#333333',
    height: 30,
    lineHeight: 30,
    textAlign: 'center',
  },
});
