import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { push } from 'react-nav-page';

export default function App() {
  return (
    <View style={styles.container}>
      <Button
        title="Go To Second Page"
        color="white"
        onPress={() => {
          push('SecondPage');
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#673ab7',
  },
});
