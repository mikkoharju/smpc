import QtQuick 1.1
import Sailfish.Silica 1.0
import "../components"

Page
{
    id: albumslistPage
    property alias listmodel: albumListView.model;
    property string artistname;
    SilicaListView {
            id : albumListView
            anchors.fill: parent
            contentWidth: width
            header: PageHeader {
                title: artistname == "" ? qsTr("albums") : artistname;
            }
            PullDownMenu {
                MenuItem {
                    text: qsTr("add albums")
                    visible: artistname === "" ? false : true;
                    onClicked: {
                        addArtist(artistname);
                    }
             }
            }
            delegate: BackgroundItem {
                Column{
                    x : theme.paddingLarge
                    anchors.verticalCenter: parent.verticalCenter
                         Label{
                             text: (title==="" ? qsTr("no album tag") : title)
                        }
                    }
                onClicked: {
                    albumClicked(artistname,title);
                }
            }
            section {
                property: 'sectionprop'
                delegate: SectionHeader {
                    text: section
                }
            }
    }

}