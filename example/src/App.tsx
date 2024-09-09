import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
const Stack = createNativeStackNavigator();
import APage from './pages/APage';
import FilePage from './pages/FilePage';
import ToastPage from './pages/ToastPage';
import HudPage from './pages/HudPage';
import PhotoBrowserPage from './pages/PhotoBrowserPage';
import RefreshPage from './pages/RefreshPage';

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="index">
        <Stack.Screen
          name="index"
          component={APage}
          options={{ title: '首页', headerBackTitleVisible: false }}
        />
        <Stack.Screen
          name="FilePage"
          component={FilePage}
          options={{ title: '文件', headerBackTitleVisible: false }}
        />
        <Stack.Screen
          name="ToastPage"
          component={ToastPage}
          options={{ title: 'Toast', headerBackTitleVisible: false }}
        />
        <Stack.Screen
          name="HudPage"
          component={HudPage}
          options={{ title: 'Hud', headerBackTitleVisible: false }}
        />

        <Stack.Screen
          name="PhotoBrowserPage"
          component={PhotoBrowserPage}
          options={{ title: '图片浏览器', headerBackTitleVisible: false }}
        />
        <Stack.Screen
          name="RefreshPage"
          component={RefreshPage}
          options={{ title: '下拉刷新', headerBackTitleVisible: false }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
