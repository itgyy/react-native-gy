import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { GYFile } from 'react-native-gy';

export default function FilePage() {
  return (
    <View>
      <TouchableOpacity
        style={styles.btn}
        onPress={() => {
          GYFile.openSystemFileManager();
        }}
      >
        <Text>打开文件管理器</Text>
      </TouchableOpacity>
      
      
      

    </View>
  );
}

const styles = StyleSheet.create({
  btn: {
    height: 50,
    backgroundColor: '#ffffff',
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius:10,
    margin:15
  },
});
