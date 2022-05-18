---
title: Android多线程使用
categories: Android
tags:
  - Android
  - Thread
  - AsyncTask
abbrlink: 123e7dd4
date: 2022-05-18 18:34:22
---

> 多线程（multithreading），是指从软件或者硬件上实现多个线程并发执行的技术。具有多线程能力的计算机因有硬件支持而能够在同一时间执行多于一个线程，进而提升整体处理性能。具有这种能力的系统包括对称多处理机、多核心处理器以及芯片级多处理或同时多线程处理器。在一个程序中，这些独立运行的程序片段叫作“线程”（Thread），利用它编程的概念就叫作“多线程处理”。多线程的应用在开发中非常常见。

<!-- more -->

## 基础使用

Android多线程实现的基础使用包括：

- 继承Thread类
- 实现Runnable接口
- Handler

### 继承Thread类

![继承Thread类](https://img-blog.csdnimg.cn/2019111311265420.png)

```java
 // 步骤1：创建线程类 （继承自Thread类）
   class MyThread extends Thread{
 
    // 步骤2：复写run（），内容 = 定义线程行为
    @Override
    public void run(){
    ... // 定义的线程行为
    }
}
 
    // 步骤3：创建线程对象，即 实例化线程类
  MyThread mt=new MyThread(“线程名称”);
 
    // 步骤4：通过 线程对象 控制线程的状态，如 运行、睡眠、挂起  / 停止
    // 此处采用 start（）开启线程
  mt.start();
```

开发者会选择一种更加方便的方法去创建线程：匿名类

```java
// 步骤1：采用匿名类，直接 创建 线程类的实例
 new Thread("线程名称") {
                 // 步骤2：复写run（），内容 = 定义线程行为
                    @Override
                    public void run() {       
                  // 步骤3：通过 线程对象 控制线程的状态，如 运行、睡眠、挂起  / 停止   
                      }.start();
```

### 实现Runnable接口

![实现Runnable接口](https://img-blog.csdnimg.cn/20191113141230159.png)

```java
 // 步骤1：创建线程辅助类，实现Runnable接口
 class MyThread implements Runnable{
    ....
    @Override
    // 步骤2：复写run（），定义线程行为
    public void run(){
 
    }
}
 
    // 步骤3：创建线程辅助对象，即 实例化 线程辅助类
  MyThread mt=new MyThread();
 
    // 步骤4：创建线程对象，即 实例化线程类；线程类 = Thread类；
    // 创建时通过Thread类的构造函数传入线程辅助类对象
    // 原因：Runnable接口并没有任何对线程的支持，我们必须创建线程类（Thread类）的实例，从Thread类的一个实例内部运行
  Thread td=new Thread(mt);
 
    // 步骤5：通过 线程对象 控制线程的状态，如 运行、睡眠、挂起  / 停止
    // 当调用start（）方法时，线程对象会自动回调线程辅助类对象的run（），从而实现线程操作
  td.start();
```

开发者会选择一种更加方便的方法去创建线程：匿名类  

```java
// 步骤1：通过匿名类 直接 创建线程辅助对象，即 实例化 线程辅助类
    Runnable mt = new Runnable() {
                    // 步骤2：复写run（），定义线程行为
                    @Override
                    public void run() {
                    }
                };
 
                // 步骤3：创建线程对象，即 实例化线程类；线程类 = Thread类；
                Thread mt1 = new Thread(mt, "窗口1");
           
                // 步骤4：通过 线程对象 控制线程的状态，如 运行、睡眠、挂起  / 停止
                mt1.start();
```

> Java中真正能创建新线程的只有Thread类对象，通过实现Runnable的方式，最终还是通过Thread类对象来创建线程，所以对于实现了Runnable接口的类，称为线程辅助类；Thread类才是真正的线程类。

### Handler

![img](https://img-blog.csdnimg.cn/20191113165713433.png)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20191113165928918.png)

Handler的使用方式 因发送消息到消息队列的方式不同而不同，共分为2种：使用Handler.sendMessage（）、使用Handler.post（）

Handler.sendMessage（）

```javs
/** 
      * 方式1：新建Handler子类（内部类）
      */
    // 步骤1：自定义Handler子类（继承Handler类） & 复写handleMessage（）方法
    class mHandler extends Handler {
 
        // 通过复写handlerMessage() 从而确定更新UI的操作
        @Override
        public void handleMessage(Message msg) {
         ...// 需执行的UI操作
            
        }
    }
 
    // 步骤2：在主线程中创建Handler实例
        private Handler mhandler = new mHandler();
 
    // 步骤3：创建所需的消息对象
        Message msg = Message.obtain(); // 实例化消息对象
        msg.what = 1; // 消息标识
        msg.obj = "AA"; // 消息内容存放
 
    // 步骤4：在工作线程中 通过Handler发送消息到消息队列中
    // 可通过sendMessage（） / post（）
    // 多线程可采用AsyncTask、继承Thread类、实现Runnable
        mHandler.sendMessage(msg);
 
    // 步骤5：开启工作线程（同时启动了Handler）
    // 多线程可采用AsyncTask、继承Thread类、实现Runnable
 
 
/** 
  * 方式2：匿名内部类
  */
   // 步骤1：在主线程中 通过匿名内部类 创建Handler类对象
            private Handler mhandler = new  Handler(){
                // 通过复写handlerMessage()从而确定更新UI的操作
                @Override
                public void handleMessage(Message msg) {
                        ...// 需执行的UI操作
                    }
            };
 
      // 步骤2：创建消息对象
    Message msg = Message.obtain(); // 实例化消息对象
      msg.what = 1; // 消息标识
      msg.obj = "AA"; // 消息内容存放
  
  // 步骤3：在工作线程中 通过Handler发送消息到消息队列中
  // 多线程可采用AsyncTask、继承Thread类、实现Runnable
   mHandler.sendMessage(msg);
 
  // 步骤4：开启工作线程（同时启动了Handler）
  // 多线程可采用AsyncTask、继承Thread类、实现Runnable
```

> 警告提示：This Handler class should be static or leaks might occur (anonymous android.os.Handler)
>
> 官方解决方法：
>
> ```java
> private Handler mHandler = new Handler(new Handler.Callback() {  
> 
>     @Override  
>     public boolean handleMessage(Message msg) {  
>         return false;  
>     }  
> }); 
> ```

Handler.post（）

```java
// 步骤1：在主线程中创建Handler实例
    private Handler mhandler = new mHandler();
 
    // 步骤2：在工作线程中 发送消息到消息队列中 & 指定操作UI内容
    // 需传入1个Runnable对象
    mHandler.post(new Runnable() {
            @Override
            public void run() {
                ... // 需执行的UI操作 
            }
 
    });
 
    // 步骤3：开启工作线程（同时启动了Handler）
    // 多线程可采用AsyncTask、继承Thread类、实现Runnable
```

## 复合使用

Android多线程实现的复合使用包括：

- AsyncTask
- HandlerThread
- IntentService

称为”复用“的主要原因是：这3种方式的本质原理都是Android多线程基础实现（继承Thread类、实现Runnable接口、Handler）的组合实现。下面，我将详细讲解。

### AsyncTask

![AsyncTask](https://img-blog.csdnimg.cn/20191119160207922.png)

> AsyncTask类属于抽象类，即使用时需实现子类
>
> AsyncTask的使用步骤
>
> 1. 创建 AsyncTask 子类 & 根据需求实现核心方法
> 2. 创建 AsyncTask子类的实例对象（即 任务实例）
> 3. 手动调用execute(（）从而执行异步线程任务

```java
/**
  * 步骤1：创建AsyncTask子类
  * 注： 
  *   a. 继承AsyncTask类
  *   b. 为3个泛型参数指定类型；若不使用，可用java.lang.Void类型代替
  *   c. 根据需求，在AsyncTask子类内实现核心方法
  */
 
  private class MyTask extends AsyncTask<Params, Progress, Result> {
 
        ....
 
      // 方法1：onPreExecute（）
      // 作用：执行 线程任务前的操作
      // 注：根据需求复写
      @Override
      protected void onPreExecute() {
           ...
        }
 
      // 方法2：doInBackground（）
      // 作用：接收输入参数、执行任务中的耗时操作、返回 线程任务执行的结果
      // 注：必须复写，从而自定义线程任务
      @Override
      protected String doInBackground(String... params) {
 
            ...// 自定义的线程任务
 
            // 可调用publishProgress（）显示进度, 之后将执行onProgressUpdate（）
             publishProgress(count);
              
         }
 
      // 方法3：onProgressUpdate（）
      // 作用：在主线程 显示线程任务执行的进度
      // 注：根据需求复写
      @Override
      protected void onProgressUpdate(Integer... progresses) {
            ...
 
        }
 
      // 方法4：onPostExecute（）
      // 作用：接收线程任务执行结果、将执行结果显示到UI组件
      // 注：必须复写，从而自定义UI操作
      @Override
      protected void onPostExecute(String result) {
 
         ...// UI操作
 
        }
 
      // 方法5：onCancelled()
      // 作用：将异步任务设置为：取消状态
      @Override
        protected void onCancelled() {
        ...
        }
  }
 
/**
  * 步骤2：创建AsyncTask子类的实例对象（即 任务实例）
  * 注：AsyncTask子类的实例必须在UI线程中创建
  */
  MyTask mTask = new MyTask();
 
/**
  * 步骤3：手动调用execute(Params... params) 从而执行异步线程任务
  * 注：
  *    a. 必须在UI线程中调用
  *    b. 同一个AsyncTask实例对象只能执行1次，若执行第2次将会抛出异常
  *    c. 执行任务中，系统会自动调用AsyncTask的一系列方法：onPreExecute() 、doInBackground()、onProgressUpdate() 、onPostExecute() 
  *    d. 不能手动调用上述方法
  */
  mTask.execute()；
```

![AsyncTask参数](https://img-blog.csdnimg.cn/20191119161139902.png)

### HandlerThread

![HandlerThread](https://img-blog.csdnimg.cn/20191119173637458.png)

HandlerThread的本质：继承Thread类 & 封装Handler类

```java
// 步骤1：创建HandlerThread实例对象
// 传入参数 = 线程名字，作用 = 标记该线程
   HandlerThread mHandlerThread = new HandlerThread("handlerThread");
 
 
 
// 步骤2：启动线程
   mHandlerThread.start();
 
// 步骤3：创建工作线程Handler & 复写handleMessage（）
// 作用：关联HandlerThread的Looper对象、实现消息处理操作 & 与其他线程进行通信
// 注：消息处理操作（HandlerMessage（））的执行线程 = mHandlerThread所创建的工作线程中执行
  Handler workHandler = new Handler( handlerThread.getLooper() ) {
            @Override
            public boolean handleMessage(Message msg) {
                ...//消息处理
                return true;
            }
        });
 
// 步骤4：使用工作线程Handler向工作线程的消息队列发送消息
// 在工作线程中，当消息循环时取出对应消息 & 在工作线程执行相关操作
  // a. 定义要发送的消息
  Message msg = Message.obtain();
  msg.what = 2; //消息的标识
  msg.obj = "B"; // 消息的存放
  // b. 通过Handler发送消息到其绑定的消息队列
  workHandler.sendMessage(msg);
 
// 步骤5：结束线程，即停止线程的消息循环
  mHandlerThread.quit();
```

### IntentService

Android里的一个封装类，继承四大组件之一的Service

> 作用：处理异步请求 & 实现多线程
> 使用场景：线程任务需按顺序、在后台执行
>
> - 最常见的场景：离线下载
> - 不符合多个数据同时请求的场景：所有的任务都在同一个Thread looper里执行

```java
步骤1：定义 IntentService的子类:传入线程名称、复写onHandleIntent()方法
public class myIntentService extends IntentService {
 
  /** 
    * 在构造函数中传入线程名字
    **/  
    public myIntentService() {
        // 调用父类的构造函数
        // 参数 = 工作线程的名字
        super("myIntentService");
    }
 
   /** 
     * 复写onHandleIntent()方法
     * 根据 Intent实现 耗时任务 操作
     **/  
    @Override
    protected void onHandleIntent(Intent intent) {
 
        // 根据 Intent的不同，进行不同的事务处理
        String taskName = intent.getExtras().getString("taskName");
        switch (taskName) {
            case "task1":
                Log.i("myIntentService", "do task1");
                break;
            case "task2":
                Log.i("myIntentService", "do task2");
                break;
            default:
                break;
        }
    }
 
    @Override
    public void onCreate() {
        Log.i("myIntentService", "onCreate");
        super.onCreate();
    }
   /** 
     * 复写onStartCommand()方法
     * 默认实现 = 将请求的Intent添加到工作队列里
     **/  
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.i("myIntentService", "onStartCommand");
        return super.onStartCommand(intent, flags, startId);
    }
 
    @Override
    public void onDestroy() {
        Log.i("myIntentService", "onDestroy");
        super.onDestroy();
    }
}


步骤2：在Manifest.xml中注册服务
<service android:name=".myIntentService">
            <intent-filter >
                <action android:name="cn.scu.finch"/>
            </intent-filter>
</service>    
                    
步骤3：在Activity中开启Service服务
public class MainActivity extends AppCompatActivity {
 
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
 
            // 同一服务只会开启1个工作线程
            // 在onHandleIntent（）函数里，依次处理传入的Intent请求
            // 将请求通过Bundle对象传入到Intent，再传入到服务里
 
            // 请求1
            Intent i = new Intent("cn.scu.finch");
            Bundle bundle = new Bundle();
            bundle.putString("taskName", "task1");
            i.putExtras(bundle);
            startService(i);
 
            // 请求2
            Intent i2 = new Intent("cn.scu.finch");
            Bundle bundle2 = new Bundle();
            bundle2.putString("taskName", "task2");
            i2.putExtras(bundle2);
            startService(i2);
 
            startService(i);  //多次启动
        }
    }
```

## 高级使用

### 线程池（ThreadPool）

![ThreadPool](https://img-blog.csdnimg.cn/20191119184102293.png)

1、ThreadPoolExecutor 创建基本线程池

```java
//创建基本线程池
final ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(3,5,1,TimeUnit.SECONDS,
        new LinkedBlockingQueue<Runnable>(100));


//基本线程池使用:设置一个按钮mThreadPoolExecute，并在点击事件中使用线程池
 mThreadPoolExecute.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                for(int i = 0;i<30;i++){
                    final int finali = i;
                    Runnable runnable = new Runnable() {
                        @Override
                        public void run() {
                            try {
                                Thread.sleep(2000);
                                Log.d("Thread", "run: "+finali);
                                Log.d("当前线程：",Thread.currentThread().getName());
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                        }
                    };
                    threadPoolExecutor.execute(runnable);
                }
            }
        });
```

**其他几种常见的线程池**

![在这里插入图片描述](https://img-blog.csdnimg.cn/20191119185404571.png)

2.FixedThreadPool (可重用固定线程数)

3.CachedThreadPool (按需创建)

4.SingleThreadPool(单个核线的fixed)

5.ScheduledThreadPool(定时延时执行)

> [1] https://blog.csdn.net/u013773608/article/details/124329942
>
> [2] https://blog.csdn.net/qq_41648631/article/details/102871630
