/****************************************************************************
** Meta object code from reading C++ file 'xread.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../PreAlpha/xread.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'xread.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Xread_t {
    QByteArrayData data[5];
    char stringdata0[28];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Xread_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Xread_t qt_meta_stringdata_Xread = {
    {
QT_MOC_LITERAL(0, 0, 5), // "Xread"
QT_MOC_LITERAL(1, 6, 7), // "readXML"
QT_MOC_LITERAL(2, 14, 0), // ""
QT_MOC_LITERAL(3, 15, 8), // "nametype"
QT_MOC_LITERAL(4, 24, 3) // "num"

    },
    "Xread\0readXML\0\0nametype\0num"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Xread[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   24,    2, 0x02 /* Public */,
       1,    1,   29,    2, 0x22 /* Public | MethodCloned */,

 // methods: parameters
    QMetaType::QString, QMetaType::QString, QMetaType::Int,    3,    4,
    QMetaType::QString, QMetaType::QString,    3,

       0        // eod
};

void Xread::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Xread *_t = static_cast<Xread *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->readXML((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: { QString _r = _t->readXML((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObject Xread::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Xread.data,
      qt_meta_data_Xread,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Xread::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Xread::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Xread.stringdata0))
        return static_cast<void*>(const_cast< Xread*>(this));
    return QObject::qt_metacast(_clname);
}

int Xread::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
