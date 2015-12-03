#ifndef XREAD_H
#define XREAD_H

#include <QObject>
#include <QtWidgets>

class Xread : public QObject
{
    Q_OBJECT
public:
    explicit Xread(QObject *parent = 0): QObject(parent) {}
    Q_INVOKABLE void readXML(){

        /*QFile file("ship.xml");

        if(file.open(QIODevice::ReadOnly)) {
                QXmlStreamReader xmlReader;
                xmlReader.setDevice(&file);
                QList<player> player;
                xmlReader.readNext();
                //Reading from the file
                while (!xmlReader.isEndDocument())
                {
                    if (xmlReader.isStartElement())
                    {
                        QString command = xmlReader.name().toString();
                        if (command == "slot")
                        {
                            QMessageBox::information(this,name,xmlReader.readElementText());
                        }
                    }else if (xmlReader.isEndElement())
                    {
                        xmlReader.readNext();
                    }
                }
                if (xmlReader.hasError())
                {
                    std::cout << "XML error: " << xmlReader.errorString().data() << std::endl;
                }
            }*/
        printf("hallo");
    }


};

#endif // XREAD_H
