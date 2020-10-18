
List<T> swap<T>(List<T> list, int indexA, int indexB) {
  if (list.length > 1) {
    var l = list;
    T tmp = l[indexA];
    l[indexA] = l[indexB];
    l[indexB] = tmp;
    return l;
  }

  return list;
}
