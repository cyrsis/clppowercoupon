import 'dart:async';
import 'dart:isolate';

////-------- Executors in Dart for Flutter -------
void main(List<String> arguments) async {
  Executor executor = await Executor.create();
  executor.run(Task('Name 1', task1));
  executor.run(Task('Name 2', task2));
  executor.run(Task('Name 3', task3));
  print('sent');
  await Future.delayed(Duration(seconds: 4));
  executor.dispose();
  print('done');
}

Future<void> task1() async {
  print('hello');
  await Future.delayed(Duration(milliseconds: 500));
}

Future<void> task2() async {
  print('world');
  await Future.delayed(Duration(milliseconds: 500));
}

Future<void> task3() async {
  print('dart');
  await Future.delayed(Duration(milliseconds: 500));
}

typedef TaskHandler<TResult> = TResult Function();

class Task<TResult> {
  final String name;
  final TaskHandler<TResult> handler;

  const Task(this.name, this.handler);

  TResult call() {
    print('start   $this');
    final result = handler();
    print('end     $this');
    return result;
  }

  @override
  String toString() {
    return 'Task{$name}';
  }
}

class Executor {
  Isolate _isolate;
  SendPort _taskPort;
  SendPort _quitPort;

  Executor._();

  static Future<Executor> create() async {
    final executor = Executor._();
    final startupPort = ReceivePort();
    executor._isolate = await Isolate.spawn(_spawn, startupPort.sendPort);
    List<SendPort> ports = await startupPort.first;
    executor._taskPort = ports[0];
    executor._quitPort = ports[1];
    return executor;
  }

  void run<T>(Task<T> task) {
    _taskPort.send(task);
  }

  void dispose() {
    _quitPort.send(null);
    _isolate.kill();
  }

  static void _spawn(SendPort executorPort) {
    final ReceivePort taskPort = ReceivePort();
    final ReceivePort quitPort = ReceivePort();
    executorPort.send([taskPort.sendPort, quitPort.sendPort]);
    taskPort.listen((task) async {
      print('running $task');
      task();
    });
    quitPort.first.then((_) {
      quitPort.close();
      taskPort.close();
    });
  }
}
