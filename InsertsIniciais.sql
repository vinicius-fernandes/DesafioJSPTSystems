insert into tiposusuario (descricao) values
('moderador'),
('comum');


insert into usuarios (login,senha,TiposUsuario_id) values
('vinicius','123abcd',1),
('ana','123abcd',2);



insert into postagens (titulo,corpo,UsuarioCriador_id) values
('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consectetur est nisl, suscipit sagittis ipsum volutpat non',
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consectetur est nisl, suscipit sagittis ipsum volutpat non. Sed id mattis risus. Morbi neque libero, malesuada in tortor a, elementum blandit sapien. Maecenas placerat congue ultrices. Suspendisse convallis varius sapien. Vestibulum a risus quam. Proin purus tortor, consectetur et aliquam sed, tincidunt vel enim. In viverra volutpat quam ac tempus. Donec lectus diam, auctor dignissim faucibus vitae, sollicitudin at metus. In ullamcorper a libero vel luctus. Donec euismod scelerisque augue id volutpat. Vestibulum et lacus mauris. Integer ac pretium turpis.

Phasellus eu mauris vel ante mollis tempor. Integer at dapibus risus. Maecenas rhoncus, mauris quis efficitur condimentum, mauris metus ultricies libero, sed tristique risus quam consequat libero. Aliquam id orci sit amet leo semper blandit. Vestibulum eu interdum mi. Vivamus vel mi et est faucibus faucibus. Phasellus vehicula tellus ac commodo convallis. In hac habitasse platea dictumst. Pellentesque ultricies urna et libero gravida, interdum cursus felis iaculis. Nunc eleifend placerat mauris, nec feugiat mauris tincidunt non. Mauris mollis tellus quis libero ultricies ornare. Aliquam sodales magna eget volutpat sagittis. Sed euismod imperdiet dolor vel accumsan. Curabitur tincidunt libero at dui bibendum, ut mollis leo malesuada. Pellentesque eget congue justo. Vestibulum lacinia, urna a sodales rhoncus, diam nunc tristique mi, vitae lobortis neque nisi cursus libero.',
1),
('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In varius ac lacus et euismod',
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In varius ac lacus et euismod. Nam condimentum, ex sit amet imperdiet condimentum, tellus justo ornare eros, quis faucibus nulla lectus ac sem. Suspendisse semper leo ac hendrerit egestas. Mauris mollis, lectus eu porta semper, nisl elit consequat diam, sit amet commodo libero nibh non mi. Suspendisse sagittis lobortis ultrices. Etiam malesuada risus nec turpis sodales vestibulum. Praesent vestibulum metus et justo vulputate, sit amet consectetur ex condimentum. Sed sit amet cursus nibh.

Vivamus massa nulla, porta ornare sapien in, elementum laoreet metus. Nunc venenatis condimentum magna id fringilla. Suspendisse justo nisl, vestibulum id libero tincidunt, blandit varius elit. Maecenas at est sed lacus iaculis sodales. Duis et urna hendrerit, varius nunc mollis, porta purus. Suspendisse aliquam gravida ipsum, non volutpat leo suscipit scelerisque. Etiam felis neque, varius ut luctus rutrum, sodales non odio. Integer ullamcorper feugiat dui vitae suscipit. In elementum blandit purus, et tristique mi. Quisque vitae leo ut metus interdum pellentesque. Maecenas faucibus dictum ullamcorper. Fusce ut condimentum mi, ac sagittis sapien. Vivamus iaculis consectetur odio. In fermentum tortor eu tortor tempor, a sagittis lorem condimentum. Nullam nec leo id ex pretium bibendum.',
1);



insert into comentarios (Postagens_id,Usuarios_id,corpo,aprovado) values 
(8,1,"Péssimo",0);
