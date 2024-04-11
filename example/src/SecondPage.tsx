import * as React from 'react';

import { StyleSheet, Text, View } from 'react-native';
import ReactNavPage from 'react-nav-page';
import { Button } from './components/Button';

export default function SecondPage(props: any) {
  const {
    params: { count },
  } = props || {};

  return (
    <View style={styles.container}>
      <Button
        label="POP"
        onPress={() => {
          ReactNavPage.setResult(100);
          ReactNavPage.pop();
        }}
      />
      <Text style={styles.count}>{count}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#ff9800',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  count: {
    fontSize: 32,
    color: '#FFF',
    fontWeight: 'bold',
  },
});
