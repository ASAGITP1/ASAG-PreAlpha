#ifndef XREAD_H
#define XREAD_H

#include <QObject>
#include <QtWidgets>
#include <QString>

class Xread : public QObject
{
    Q_OBJECT
public:
    explicit Xread(QObject *parent = 0): QObject(parent) {}
    Q_INVOKABLE QString readXML(QString nametype, int num){

        QFile file("ship.xml");
        //QString nametype= QString::fromStdString(type);
        QString numid= QString::number(num);
        //var nametype is used to check if program wants ship or slot information
        //var numid is used to search for the right slot number
        QString answerid ="0";


        if(file.open(QIODevice::ReadOnly)) {
                QXmlStreamReader xmlReader;
                xmlReader.setDevice(&file);

                xmlReader.readNext();
                //Reading from the file
                while (!xmlReader.isEndDocument())
                {
                    if (xmlReader.isStartElement())
                    {

                        QString command = xmlReader.name().toString();
                        if (command == nametype) //searching for the needed tag
                        {


                            if(nametype=="slot"){
                                                QXmlStreamAttributes attr = xmlReader.attributes();

                                                if (attr.value("num").toString() == numid){
                                                    answerid=attr.value("id").toString();
                                                    break;

                                                }




                            }
                            else{
                                xmlReader.readNext();
                            }


                        }
                        else{
                            xmlReader.readNext();
                        }
                    }else
                    {
                        xmlReader.readNext();
                    }
                }
                if (xmlReader.hasError())
                {
                    printf("error in XML...");
                }
            }

        return answerid;
    }


};

#endif // XREAD_H
