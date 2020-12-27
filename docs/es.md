# Introduccion

No me complicare en explicar mucho. Esta app es solo para una prueba con una empresa.

# Funcionamiento

## Pantalla de inicio

Ingresa con cualquier nombre. La app no tiene un sistema de usuarios como tal sin embargo los chats estan vinculados con el nobmre de usuario receptor y emisor y los mensajes con dicho chat.

<img src="https://github.com/Noxware/flutter_firebase_chat/blob/main/docs/media/intro.jpg?raw=true" alt="drawing" width="300"/>

## Lista de chats

Aqui veras todos los chats en los que el nombre de usuario participa.

> NOTA: Los avatares son aleatorias, son simplemente por presentacion de la app y puede cambiar en cualquier momento. Abajo del titulo del chat deberias ver el ultimo mensaje del chat si es que existe. Debido a que toda la app usa streams ese mensaje actualizara aunque no estes viendo el chat.

<img src="https://github.com/Noxware/flutter_firebase_chat/blob/main/docs/media/list.jpg?raw=true" alt="drawing" width="300"/>

## Iniciar conversacion

Toca el boton flotante en la parte inferior derecha de la lista de chats e ingresa un nombre de usuario que sera participante del chat junto a ti.

<img src="https://github.com/Noxware/flutter_firebase_chat/blob/main/docs/media/new.jpg?raw=true" alt="drawing" width="300"/>

## Chat

Manda y recibe mensajes en tiempo real con la persona.

<img src="https://github.com/Noxware/flutter_firebase_chat/blob/main/docs/media/chat.jpg?raw=true" alt="drawing" width="300"/>

# Aclaraciones

- Toda la interaccion con firebase se hace mediante streams asi que todo se mantiene en sincronia.

- Apenas me decidi con la base de datos y la hice funcionar no me preocupe mas por la perfomance, solo por la presentacion de la app pues esto como dije es para presentarselo a una empresa nada mas.

- Las imagenes fueron sacadas de Pixabay y estan bajo la 'Pixabay License' que permite su uso y distribucion incluso en apps comerciales sin atribucion. El logo es un edit de una imagen de alli.

- Se admiten mensajes vacios aproposito.