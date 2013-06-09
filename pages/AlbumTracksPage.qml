import QtQuick 1.1
import Sailfish.Silica 1.0
import "../components"

Page
{
    id: albumTracksPage
    property alias listmodel: albumTracksListView.model;
    property string albumname;
    property string artistname;
    SilicaListView {
            id : albumTracksListView
            anchors.fill: parent
            contentWidth: width
            header: PageHeader {
                title: albumname;
            }
            PullDownMenu {
                MenuItem {
                    text: qsTr("add album")
                    onClicked: {
                        addAlbum([artistname,albumname]);
                    }
             }
                MenuItem {
                    text: qsTr("play album")
                    onClicked: {
                        playAlbum([artistname,albumname]);
                    }
             }
            }
            delegate: BackgroundItem {

                Column{
                    x : theme.paddingLarge
                    anchors.verticalCenter: parent.verticalCenter
                        Row{
                            Label {text: (index+1)+". ";anchors {verticalCenter: parent.verticalCenter}}
                            Label {clip: true; wrapMode: Text.WrapAnywhere; elide: Text.ElideRight; text:  (title==="" ? filename : title);font.italic:(playing) ? true:false;anchors {verticalCenter: parent.verticalCenter}}
                            Label { text: (length===0 ? "": " ("+lengthformated+")");anchors {verticalCenter: parent.verticalCenter}}
                        }
                        Label{
                            text:(artist!=="" ? artist + " - " : "" )+(album!=="" ? album : "");
                            color: theme.secondaryColor;
                            font.pixelSize: theme.fontSizeSmall
                        }
                    }
                onClicked: {
                    albumTrackClicked(title,album,artist,lengthformated,uri,year,tracknr);
                }
            }
    }

}