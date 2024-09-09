import { ScrollView, StyleSheet, Text, TouchableOpacity } from 'react-native';
import { useNavigation } from '@react-navigation/native';

export default function APage() {
  const nav = useNavigation<any>();
  const Item = (title: string, onPress: () => void) => {
    return (
      <TouchableOpacity activeOpacity={1} style={styles.item} onPress={onPress}>
        <Text>{title}</Text>
      </TouchableOpacity>
    );
  };
  return (
    <ScrollView style={{ flex: 1 }} contentContainerStyle={{ padding: 10 }}>
      {Item('File', () => {
        nav.navigate('FilePage');
      })}
      {Item('Toast', () => {
        nav.navigate('ToastPage');
      })}
      {Item('Hud', () => {
        nav.navigate('HudPage');
      })}
      {Item('PhotoBrowser', () => {
        nav.navigate('PhotoBrowserPage');
      })}
      {Item('RefreshPage', () => {
        nav.navigate('RefreshPage');
      })}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  item: {
    height: 50,
    backgroundColor: '#ffffff',
    justifyContent: 'center',
    alignItems: 'center',
    borderBottomColor: '#eeeeee',
    borderBottomWidth: 1,
  },
});
