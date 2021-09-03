#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QStandardPaths>
#include <QFile>
#include <QDir>
#include <QCryptographicHash>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
//    QString localPath = QStandardPaths::writableLocation( QStandardPaths::AppDataLocation );
//       QString dbpath = appdir() + "/OfflineStorage/Databases/e04d88072f90f86a07481418b8ff4b6b.sqlite";
//       QString offline_path = appdir() + "/OfflineStorage";
//       engine.setOfflineStoragePath(QString(offline_path));
//       qDebug() << "New storage path >> "+engine.offlineStoragePath();


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    qDebug() << engine.offlineStoragePath();
    return app.exec();
}
