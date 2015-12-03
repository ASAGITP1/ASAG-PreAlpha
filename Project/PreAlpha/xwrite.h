#ifndef XWRITE_H
#define XWRITE_H

#include <QObject>
#include <QtWidgets>

class Xwrite : public QObject
{
    Q_OBJECT
public:
    explicit Xwrite(QObject *parent = 0): QObject(parent) {}
    Q_INVOKABLE void writeXML(int a){
        QXmlStreamWriter xmlWriter;
        QFile file("ship.xml");

        //Variables have to be integer to calculate with them
        int id=a;
        int lvl=1;
        id+=1;
        lvl+=199;

        //QString is the needed type of variables for the QXmlStreamWriter, therefore we need to convert int to QString
        QString idS = QString::number(id);
        QString lvlS = QString::number(lvl);

        if (!file.open(QIODevice::WriteOnly))
        {
          QMessageBox::warning(0, "Error!", "Error opening file");
        }
        else
        {
        xmlWriter.setDevice(&file);

        /* Writes a document start with the XML version number. */
        xmlWriter.writeStartDocument();
        xmlWriter.writeStartElement("player");

        xmlWriter.writeStartElement("slot");
        /*add one attribute and its value*/
        xmlWriter.writeAttribute("id",idS);
        /*add character data to tag student */
        xmlWriter.writeCharacters (lvlS);
        /*close tag student  */
        xmlWriter.writeEndElement();

            /*end tag students*/
            xmlWriter.writeEndElement();
            /*end document */
            xmlWriter.writeEndDocument();
        }
    }


};

#endif // XWRITE_H
