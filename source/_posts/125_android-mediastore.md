---
title: Android文件存储媒体库库MediaStore
categories: Android
tags:
  - Android
  - MediaStore
abbrlink: 5bfb2f95
date: 2022-05-18 16:43:28
---
> MediaStore是android系统提供的一个多媒体数据库，专门用于存放多媒体信息的，通过ContentResolver即可对数据库进行操作。媒体库提供来自任何附加存储设备的常见媒体类型的索引集合，例如Audio、Video和。Images每个集合都是根据底层内容的主要 MIME 类型组织的；例如，image/*内容在Images. 该Files集合提供了所有集合的广泛视图，并且不按 MIME 类型进行过滤。

<!-- more -->

### 关于MediaStore

MediaStore是android系统提供的一个多媒体数据库，专门用于存放多媒体信息的，通过ContentResolver即可对数据库进行操作。

MediaStore.Files: 共享的文件,包括多媒体和非多媒体信息；
MediaStore.Audio: 存放音频信息；
MediaStore.Image: 存放图片信息；
MediaStore.Vedio: 存放视频信息；

每个内部类中都又包含了Media,Thumbnails和相应的MediaColumns，分别提供了媒体信息，缩略信息和操作字段。

MediaStore 示例：

```java
ContentResolver contentResolver = this.getContentResolver();
Uri imgUri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
Uri firstImgUri = null;
Cursor cursor = contentResolver.query( imgUri, null, null, null );
if(cursor!=null&&cursor.getCount()>0){
    cursor.moveToFirst();
    firstImgUri = Uri.fromFile(new File(cursor.getString(cursor.getColumnIndex(MediaStore.Images.Media.DATA))));
    do {
        Log.d(TAG, "img cursor data=" + cursor.getString(cursor.getColumnIndex(MediaStore.Images.Media.DATA))
                + ";\nimg cursor type="
                + cursor.getString(cursor.getColumnIndex(MediaStore.Images.Media.MIME_TYPE)));
    } while (cursor.moveToNext());
}
Log.d(TAG,"firstImgUri="+firstImgUri);
try{
    ParcelFileDescriptor parcelFileDescriptor = contentResolver.openFileDescriptor(firstImgUri, "r");
    if (Build.VERSION.SDK_INT >= 29) {
        Bitmap bitmap = contentResolver.loadThumbnail(firstImgUri, new Size(200, 200), null);
    }
}catch(Exception e){
    Log.d(TAG, "exception: " + e.getMessage());
}
```

### 常用MediaStore API

1.查询媒体文件：query()

用 MediaStore 提供的 Uri 指定设备，selection 参数指定过滤条件，通过 ContentResolver.query 接口查询文件 Uri。

```
Uri external = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;

ContentResolver resolver = context.getContentResolver();

String selection = MediaStore.Images.Media.TITLE + "=?";
String[] args = new String[] {"Image"};
String[] projection = new String[] {MediaStore.Images.Media._ID};
Cursor cursor = resolver.query(external, projection, selection, args, null);
Uri imageUri = null;

if (cursor != null && cursor.moveToFirst()) {
    imageUri = ContentUris.withAppendedId(external, cursor.getLong(0));
    cursor.close();
}
```

2.打开媒体文件：openFileDescriptor()

3.添加媒体文件：Uri songContentUri = resolver.insert(audioCollection, songDetails);

```java
audioCollection = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
ContentValues songDetails = new ContentValues();
songDetails.put(MediaStore.Audio.Media.DISPLAY_NAME,"My Workout Playlist.mp3");
songDetails.put(MediaStore.Audio.Media.IS_PENDING, 1);
```

4.更新媒体文件：resolver.update(item, values, null, null);

5.单个媒体文件的缩略图，调用loadThumbnail()。

### MediaStore文件操作示例

```java
打开媒体文件
用于打开媒体文件的具体逻辑取决于媒体内容最佳表示形式是文件描述符、文件流还是直接文件路径：

文件描述符
如需使用文件描述符打开媒体文件，请使用类似于以下代码段所示的逻辑：
// Open a specific media item using ParcelFileDescriptor.
ContentResolver resolver = getApplicationContext()
        .getContentResolver();

// "rw" for read-and-write;
// "rwt" for truncating or overwriting existing file contents.
String readOnlyMode = "r";
try (ParcelFileDescriptor pfd =
        resolver.openFileDescriptor(content-uri, readOnlyMode)) {
    // Perform operations on "pfd".
} catch (IOException e) {
    e.printStackTrace();
}

文件流
如需使用文件流打开媒体文件，请使用类似于以下代码段所示的逻辑：
// Open a specific media item using InputStream.
ContentResolver resolver = getApplicationContext()
        .getContentResolver();
try (InputStream stream = resolver.openInputStream(content-uri)) {
    // Perform operations on "stream".
}

直接文件路径
如果您没有任何与存储空间相关的权限，您可以访问应用专属目录中的文件，并可使用 File API 访问归因于您的应用的媒体文件。  
    
性能
当您使用直接文件路径依序读取媒体文件时，其性能与 MediaStore API 相当。
但是，当您使用直接文件路径随机读取和写入媒体文件时，进程的速度可能最多会慢一倍。在此类情况下，我们建议您改为使用 MediaStore API。

DATA 列
当您访问现有媒体文件时，您可以使用您的逻辑中 DATA 列的值。这是因为，此值包含有效的文件路径。但是，不要假设文件始终可用。请准备好处理可能发生的任何基于文件的 I/O 错误。
另一方面，如需创建或更新媒体文件，请勿使用 DATA 列的值。请改用 DISPLAY_NAME 和 RELATIVE_PATH 列的值。

分享
某些应用允许用户彼此分享媒体文件。例如，用户可以通过社交媒体应用与朋友分享照片和视频。
如需共享媒体文件，请按照 
[content provider 创建指南]:
https://developer.android.google.cn/guide/topics/providers/content-provider-creating?hl=fr
中的建议使用 `content://` URI。


添加项目
如需将媒体项添加到现有集合，请调用类似于以下内容的代码。此代码段可在搭载 Android 10 或更高版本的设备上访问 VOLUME_EXTERNAL_PRIMARY 卷。这是因为在这些设备上，您只能修改主要卷的内容，如存储卷部分所述。
// Add a specific media item.
ContentResolver resolver = getApplicationContext()
        .getContentResolver();

// Find all audio files on the primary external storage device.
Uri audioCollection;
if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
    audioCollection = MediaStore.Audio.Media
            .getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
} else {
    audioCollection = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
}

// Publish a new song.
ContentValues newSongDetails = new ContentValues();
newSongDetails.put(MediaStore.Audio.Media.DISPLAY_NAME,
        "My Song.mp3");

// Keeps a handle to the new song's URI in case we need to modify it
// later.
Uri myFavoriteSongUri = resolver
        .insert(audioCollection, newSongDetails);


切换媒体文件的待处理状态
如果您的应用执行可能非常耗时的操作（例如写入媒体文件），那么在处理文件时对其进行独占访问非常有用。在搭载 Android 10 或更高版本的设备上，您的应用可以通过将 IS_PENDING 标记的值设为 1 来获取此独占访问权限。如此一来，只有您的应用可以查看该文件，直到您的应用将 IS_PENDING 的值改回 0。

以下代码段基于前面的代码段进行构建。以下代码段显示了在与 MediaStore.Audio 集合对应的目录中存储一首较长的歌曲时如何使用 IS_PENDING 标记：

// Add a media item that other apps shouldn't see until the item is
// fully written to the media store.
ContentResolver resolver = getApplicationContext()
        .getContentResolver();

// Find all audio files on the primary external storage device.
Uri audioCollection;
if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
    audioCollection = MediaStore.Audio.Media
            .getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
} else {
    audioCollection = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
}

ContentValues songDetails = new ContentValues();
songDetails.put(MediaStore.Audio.Media.DISPLAY_NAME,
        "My Workout Playlist.mp3");
songDetails.put(MediaStore.Audio.Media.IS_PENDING, 1);

Uri songContentUri = resolver
        .insert(audioCollection, songDetails);

try (ParcelableFileDescriptor pfd =
        resolver.openFileDescriptor(songContentUri, "w", null)) {
    // Write data into the pending audio file.
}

// Now that we're finished, release the "pending" status, and allow other apps
// to play the audio track.
songDetails.clear();
songDetails.put(MediaStore.Audio.Media.IS_PENDING, 0);
resolver.update(songContentUri, songDetails, null, null);


更新项目
如需更新应用拥有的媒体文件，请运行类似于以下内容的代码：
// Updates an existing media item.
long mediaId = // MediaStore.Audio.Media._ID of item to update.
ContentResolver resolver = getApplicationContext()
        .getContentResolver();

// When performing a single item update, prefer using the ID
String selection = MediaStore.Audio.Media._ID + " = ?";

// By using selection + args we protect against improper escaping of
// values. Here, "song" is an in-memory object that caches the song's
// information.
String[] selectionArgs = new String[] { getId().toString() };

// Update an existing song.
ContentValues updatedSongDetails = new ContentValues();
updatedSongDetails.put(MediaStore.Audio.Media.DISPLAY_NAME,
        "My Favorite Song.mp3");

// Use the individual song's URI to represent the collection that's
// updated.
int numSongsUpdated = resolver.update(
        myFavoriteSongUri,
        updatedSongDetails,
        selection,
        selectionArgs);

注意：您可以在调用 update() 的过程中通过更改 MediaColumns.RELATIVE_PATH 或 MediaColumns.DISPLAY_NAME 在磁盘上移动文件。
```

### 关于MediaStore Pending

Android Q 上，MediaStore 中添加了一个 IS_PENDING Flag，用于标记当前文件是 Pending 状态。

其他 APP 通过 MediaStore 查询文件，如果没有设置 setIncludePending 接口，就查询不到设置为 Pending 状态的文件，这就能使 APP 专享此文件。

这个 flag 在一些应用场景下可以使用，例如在下载文件的时候：下载中，文件设置为 Pending 状态；下载完成，把文件 Pending 状态置为 0。

```java
ContentValues values = new ContentValues();
values.put(MediaStore.Images.Media.DISPLAY_NAME, "myImage.PNG");
values.put(MediaStore.Images.Media.MIME_TYPE, "image/png");
values.put(MediaStore.Images.Media.IS_PENDING, 1);

ContentResolver resolver = context.getContentResolver();
Uri uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
Uri item = resolver.insert(uri, values);

try {
    ParcelFileDescriptor pfd = resolver.openFileDescriptor(item, "w", null);
    // write data into the pending image.
} catch (IOException e) {
    LogUtil.log("write image fail");
}

// clear IS_PENDING flag after writing finished.
values.clear();
values.put(MediaStore.Images.Media.IS_PENDING, 0);//释放，使其他应用可以访问
resolver.update(item, values, null, null);
```

**IS_PENDING独占**：Android 10以后，当写入磁盘时 应用可以通过IS_PENDING标志实现对媒体文件的独占访问。

### 相关参考

[1] 安卓 11 使用 MediaRecorder 录制视频，由于新的分区存储特性（Scoped Storage，APP 产生的文件只能通过 MediaStore API 写入磁盘），存储路径无法直接使用外部 SD 卡的路径。
https://www.jianshu.com/p/edaa0d9df93e

[2] 重命名由android 10中的应用程序创建的Mediastore的文件
https://codingdict.com/questions/107164

[3] Android 10、11 存储完全适配！
https://blog.csdn.net/fitaotao/article/details/119700579

[4] Android10_存储之scoped storage&媒体文件-分区存储权限变更及适配
https://blog.csdn.net/u010227042/article/details/104507886

[5] *Android Q 存储新特性适配脑壳疼？指南来了！
https://www.163.com/dy/article/EL0CD9QG0511IFOV.html
https://mp.weixin.qq.com/s/aiDMyAfAZvaYIHuIMLAlcg

[6] *访问共享存储空间中的媒体文件
https://developer.android.google.cn/training/data-storage/shared/media?hl=fr
