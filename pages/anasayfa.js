import React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { Button, Toast } from 'native-base';
import MapView, {PROVIDER_GOOGLE, Marker} from 'react-native-maps';
import RNAndroidLocationEnabler from 'react-native-android-location-enabler';
import Geolocation from 'react-native-geolocation-service';
import axios from 'axios';
import {RNCamera} from 'react-native-camera';
import {StackActions} from '@react-navigation/native';

console.log( RNCamera );

class App extends React.Component{
  constructor( props ){
    super( props );
    this.state = {
      url:"https://lamerdiary.com/services/service.php?",
      latitude: 41.0391683,
      longitude: 28.9982707,
      latitudeDelta: 1.2,
      longitudeDelta: 1.2,
      removeButtonStyle:"0%",
      positions:[],
      selectedMarker:""
    }
  }

  getPositions=async()=>{
    let url = this.state.url+"komut=liste";
    axios.get( url ).then( res => {
      this.setState( {positions: res.data.data} );
    });
  }

  getPosition=( yaz=false )=>{
    Geolocation.getCurrentPosition( position => {
      console.log( (position.coords) );
      this.setState( {latitude: position.coords.latitude} );
      this.setState( {longitude: position.coords.longitude} );
      //this.setState( {latitudeDelta: position.coords.latitudeDelta} );
      //this.setState( {longitudeDelta: position.coords.longitudeDelta} );
      if ( yaz == true ){
        let url = this.state.url+"komut=ekle&hash=f90415ed3e3546a23241f5d3ec417e18&latitude="+position.coords.latitude+"&longitude="+position.coords.longitude;
        console.log( {url} );
        axios.get( url ).then( res => {
          console.log( res.data );
          if ( res.data.status == 1 ){
            this.getPositions();
            alert( res.data.message );
            
          }
        });
      }
    });
  }

  removePosition=()=>{
    if ( this.state.selectedMarker && this.state.selectedMarker != "" ){
      axios.get( this.state.url + "komut=guncelle&id=" + this.state.selectedMarker).then( res => {
        console.log( res.data );
        if ( res.data.status == 1 ){
          this.getPositions();
          alert( res.data.message );
        }
      });
    }
    else{
      alert("Kutu noktası seçmediniz. Kutuyu kaldırmak için kutu noktalarından birini seçip kaldır demeniz yeterlidir.");
    }

  }

  openGps = () => {
    RNAndroidLocationEnabler.promptForEnableLocationIfNeeded({
      interval: 10000,
      fastInterval: 5000,
    }).then( data => {
      if ( data  ){
        this.getPosition();
      }
      else{
        this.openGps();
      }
    }).catch(err=>{
      this.openGps();
    });
  }

  _onRegionChange=(position)=>{
    //this.setState( {latitudeDelta: position.latitudeDelta} );
    //this.setState( {longitudeDelta: position.longitudeDelta} );
  }
  _markerOnpress=(e)=>{
    this.setState( {removeButtonStyle:"50%"} );
    this.setState( {selectedMarker: e.id} );
  }

  goToPage=(pageName, data)=>{
    const stackAction = StackActions.push( pageName, data );
    this.props.navigation.dispatch( stackAction );
  }


  componentDidMount(){
    this.openGps();
    this.getPositions();
  }

  render(){
    return(
        <View style={styles.mainView}>
          <View style={{flex:90}}>
            <MapView
                provider={PROVIDER_GOOGLE}
                showsUserLocation={true}
                zoomEnabled={true}
                style={{flex:1}}
                initialRegion={{
                  latitude: this.state.latitude,
                  longitude: this.state.longitude,
                  latitudeDelta: this.state.latitudeDelta,
                  longitudeDelta: this.state.longitudeDelta      
                }}
                region={{
                  latitude: this.state.latitude ,
                  longitude: this.state.longitude,
                  latitudeDelta: this.state.latitudeDelta,
                  longitudeDelta: this.state.longitudeDelta     
                }}

                onRegionChange={this._onRegionChange}>
                 {
                   this.state.positions && this.state.positions.map((v,k) => (
                    <Marker
                      key={v.id}
                        coordinate={{
                          latitude: parseFloat( v.latitude ),
                          longitude: parseFloat( v.longitude ),
                        }}
                        name={v.id}
                        title={"Başlık Eklenecek"}  
                        description={"Açıklama Eklenecek"}   
                        onPress={ this._markerOnpress.bind(this,v) } />
                   ))
                 }
            </MapView>
          </View>
          <View style={styles.buttonView}>
            <View style={{flex:1}}>
                <Button secondary style={styles.Button} onPress={ ()=>{this.goToPage("Barcode", {})} }>
                  <Text style={styles.ButtonText}>Kutu Ekle</Text>
                </Button>
            </View>
            <View style={{width:this.state.removeButtonStyle}}>
                <Button danger style={styles.Button} onPress={ ()=>{this.removePosition()} }>
                  <Text style={styles.ButtonText}>Kaldır</Text>
                </Button>
            </View>              
          </View>
        </View>
    );
  }
}

const styles = StyleSheet.create({
  mainView:{flex:1},
  buttonView:{
    flex:10, flexDirection:"row", justifyContent:"center", alignItems:"center"
  },
  Button:{
    width:'100%',
    justifyContent:'center'
  },
  ButtonText:{
    color:"white"
  }
});

export default App;