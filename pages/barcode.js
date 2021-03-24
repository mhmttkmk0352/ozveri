import React from 'react';
import { SafeAreaView, Text} from 'react-native';
import {RNCamera} from 'react-native-camera';


class App extends React.Component{
    onBarCodeRead=(e)=>{
        alert( e.data );
    }
    render(){
        return(
            <RNCamera
            style={{flex:1}}
            type={RNCamera.Constants.Type.back}
            flashMode={RNCamera.Constants.FlashMode.on}
            captureAudio={false}
            androidCameraPermissionOptions={{
              title: 'Kamera izni gerekiyor',
              message: 'Kamera ile manzara fotoğrafı çekmek için izin vermeniz gerekiyor.',
              buttonPositive: 'Tamam',
              buttonNegative: 'İptal'
            }}
            androidRecordAudioPermissionOptions={{
              title: 'Mikrofon izni gerekiyor',
              message: 'Mikrofon ile ses kaydı yapmak için için izin vermeniz gerekiyor.',
              buttonPositive: 'Tamam',
              buttonNegative: 'İptal'
            }}
            onBarCodeRead={this.onBarCodeRead}
          />
        );
    }
}

export default App;