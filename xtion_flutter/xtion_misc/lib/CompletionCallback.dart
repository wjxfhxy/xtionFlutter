
typedef SuccessedCallback<T> = void Function(T t);

typedef FailCallback = void Function();

class CompletionCallback<T> {

  SuccessedCallback<T> successedCallback;

  FailCallback failCallback;
}