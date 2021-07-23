# MoviesCollection
Коллекция из популярных фильмов
В ходе работы использовал 2 библиотеки: SnapKit для более быстрой верстки кодом и SDWebImage для загрузки изображения в фоновом режиме с автоматическим добавлением их в кэш. Таким образом, при оффлайн режиме данные, которые успели загрузиться, будут доступны на устройстве.

Запрос делается на сайте https://www.themoviedb.org/, приходит JSON, из которого парсятся данные в CollectionView. По нажатию на ячейку появляется еще экран с более подробным описанием фильма
![alt text](https://github.com/eni1396/MoviesCollection/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202021-06-23%20at%2000.11.54.png)
![alt text](https://github.com/eni1396/MoviesCollection/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202021-06-23%20at%2000.12.06.png)
