class ImageModel {
  late final String id;
  late final String author;
  late final int width;
  late final int height;
  late final String url;
  late final String downloadUrl;

  ImageModel(
      {required this.id,
      required this.author,
      required this.width,
      required this.height,
      required this.url,
      required this.downloadUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'] ?? 'not found';
    width = json['width'];
    height = json['height'];
    url = json['url'] ?? 'not found';
    downloadUrl = json['download_url'] ??
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAAOVBMVEXg4OB1dXXX19fd3d2EhIR9fX14eHjJycm2trbb29uurq6goKCZmZmIiIiBgYHNzc2np6e8vLySkpKXK8HrAAABuUlEQVR4nO3Z0bKCIBCAYQNFVCzr/R/2nHU6k8KpJi6wZf7vLu1id9gFhKYBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAb249h7pzr5jD29uhospnlfNo4L+boiLKYyZ0iblKYiu/iNER3PTquD9npPgbB98Za0/twH59JVasMtzXo1m+iHny7PrwpysSuebgxCtmOTlkma121l/TFZR2UqXxEebxEO/87QZlZ3inpeCPzVftkojUyJp2OWVgKy23qSsbg8evitBSXkUjHzYN9Is0oeWoYkkUKazsxRYlYKa6ldFSfs7K/8tsnUSLrXHAuG1SOXpp5t1LEiQxSe33ZqDJIC4TdkziRJkRN9J1CXFlpIj7J9RvNSd0kiUj1zSVjyiKr4X5yTRIx0kYlY8oinbzfFSaJWFlJSsaUpZpEqimttNkTOpo9nX4TOqbfdEFM6FgQpW7c8OofSrYo1Wwaq9nG1/NhVc2nbj2HD821kuOgeg7o3hyZBj1Hpo9D7M3K+HeIrSmPeq4Vfl3ruOhpnly9vdyEfa1KLkPF7nr66GAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPjcD13rCcC3ILx/AAAAAElFTkSuQmCC';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['author'] = author;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    data['download_url'] = downloadUrl;
    return data;
  }
}
