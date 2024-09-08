import { View, Text } from 'react-native';
import React, { forwardRef, useEffect, useImperativeHandle } from 'react';
import { NativeModules } from 'react-native';
const manager = NativeModules.GYPhotoBrowser;

type GYPhotoBrowserAction = {
  show: () => void;
};

type IProps = {
  datas: Array<IData>;
  index: number;
};
type IData = {
  url: string;
  videoUrl?: string;
};

const GYPhotoBrowser = forwardRef<GYPhotoBrowserAction, IProps>(
  (props, ref) => {
    useEffect(() => {}, []);

    useImperativeHandle(ref, () => ({
      show: () => {
        manager.show(props.datas, props.index, null);
      },
    }));

    return null;
  }
);
export type { GYPhotoBrowserAction };
export default GYPhotoBrowser;
