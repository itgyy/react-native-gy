import { Component } from 'react';
import { ScrollView, type ScrollViewProps } from 'react-native';

interface GYScrollViewProps extends ScrollViewProps {
  enableMJRefresh?: boolean;
  onMJRefresh?: () => void;
  mjRefreshing?: boolean;
}

export default class GYScrollView extends Component<GYScrollViewProps> {
  constructor(props: GYScrollViewProps) {
    super(props);
  }
  render() {
    return <ScrollView {...this.props}></ScrollView>;
  }
}
