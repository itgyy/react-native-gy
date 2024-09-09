import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { GYToast, GYToastDuration } from 'react-native-gy';

export default function ToastPage() {
  return (
    <View>
      <TouchableOpacity
        style={styles.btn}
        onPress={() => {
          GYToast.show('xxxxxx', GYToastDuration.SHORT);
        }}
      >
        <Text>Toast</Text>
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
    borderRadius: 10,
    margin: 15,
  },
});
