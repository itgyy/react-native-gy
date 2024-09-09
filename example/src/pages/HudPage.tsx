import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { GYHud } from 'react-native-gy';

export default function HudPage() {
  return (
    <View>
      <TouchableOpacity
        style={styles.btn}
        onPress={() => {
          GYHud.show('xxxxxx');
          setTimeout(() => {
            GYHud.dismiss();
          }, 5000);
        }}
      >
        <Text>Hud</Text>
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
