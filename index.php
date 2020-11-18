<?php include_once 'includes/templates/header.php'; ?>

       

        <section class="programa">
            <div class="contenedor-video">
                <video autoplay loop muted poster="img/bg-talleres.jpg">
                    <source src="video/video.mp4" type="video/mp4">
                    <source src="video/video.webm" type="video/webm">
                    <source src="video/video.ogv" type="video/ogg">
                </video>
            </div> <!--.contenedor-video-->
            <div class="contenido-programa">
                <div class="contenedor">
                    <div class="programa-evento">
                        <h2>Nuestros Eventos</h2>

                        <?php
                            try {
                              require_once('includes/funciones/bd_conexion.php');
                              $sql = "SELECT * FROM `categoria_evento` ";
                              $resultado = $conn->query($sql);
                            } catch (Exception $e) {
                              $error = $e->getMessage();
                            }
                         ?>
                        <nav class="menu-programa">
                          <?php while($cat = $resultado->fetch_array(MYSQLI_ASSOC)) { ?>
                            <?php $categoria = $cat['cat_evento']; ?>
                                <a href="#<?php echo strtolower($categoria) ?>">
                                      <i class="fa <?php echo $cat['icono'] ?>" aria-hidden="true"></i> <?php echo $categoria ?>
                                </a>
                          <?php } ?>
                        </nav>

                        <?php
                            try {
                              require_once('includes/funciones/bd_conexion.php');
                              $sql = "SELECT `evento_id`, `nombre_evento`, `fecha_evento`, `hora_evento`, `cat_evento`, `nombre_invitado`, `apellido_invitado` ";
                              $sql .= "FROM `eventos` ";
                              $sql .= "INNER JOIN `categoria_evento` ";
                              $sql .= "ON eventos.id_cat_evento=categoria_evento.id_categoria ";
                              $sql .= "INNER JOIN `invitados` ";
                              $sql .= "ON eventos.id_inv=invitados.invitado_id ";
                              $sql .= "AND eventos.id_cat_evento = 1 ";
                              $sql .= "ORDER BY `evento_id` LIMIT 2;";
                              $sql .= "SELECT `evento_id`, `nombre_evento`, `fecha_evento`, `hora_evento`, `cat_evento`, `nombre_invitado`, `apellido_invitado` ";
                              $sql .= "FROM `eventos` ";
                              $sql .= "INNER JOIN `categoria_evento` ";
                              $sql .= "ON eventos.id_cat_evento=categoria_evento.id_categoria ";
                              $sql .= "INNER JOIN `invitados` ";
                              $sql .= "ON eventos.id_inv=invitados.invitado_id ";
                              $sql .= "AND eventos.id_cat_evento = 2 ";
                              $sql .= "ORDER BY `evento_id` LIMIT 2;";
                              $sql .= "SELECT `evento_id`, `nombre_evento`, `fecha_evento`, `hora_evento`, `cat_evento`, `nombre_invitado`, `apellido_invitado` ";
                              $sql .= "FROM `eventos` ";
                              $sql .= "INNER JOIN `categoria_evento` ";
                              $sql .= "ON eventos.id_cat_evento=categoria_evento.id_categoria ";
                              $sql .= "INNER JOIN `invitados` ";
                              $sql .= "ON eventos.id_inv=invitados.invitado_id ";
                              $sql .= "AND eventos.id_cat_evento = 3 ";
                              $sql .= "ORDER BY `evento_id` LIMIT 2;";
                            } catch (Exception $e) {
                              $error = $e->getMessage();
                            }
                         ?>

                        <?php $conn->multi_query($sql); ?>

                        <?php
                            do {
                                $resultado = $conn->store_result();
                                $row = $resultado->fetch_all(MYSQLI_ASSOC);    ?>

                                <?php $i = 0; ?>
                                <?php foreach($row as $evento): ?>
                                  <?php if($i % 2 == 0) { ?>
                                    <div id="<?php echo strtolower($evento['cat_evento']) ?>" class="info-curso ocultar clearfix">
                                  <?php } ?>
                                          <div class="detalle-evento">
                                              <h3><?php echo html_entity_decode($evento['nombre_evento']) ?></h3>
                                              <p><i class="fa fa-clock-o" aria-hidden="true"></i> <?php echo $evento['hora_evento']; ?></p>
                                              <p><i class="fa fa-calendar" aria-hidden="true"></i> <?php echo $evento['fecha_evento']; ?></p>
                                              <p><i class="fa fa-user" aria-hidden="true"></i> <?php echo $evento['nombre_invitado'] . " " .  $evento['apellido_invitado']; ?></p>
                                          </div>
                                  <?php if($i % 2 == 1): ?>
                                        <a href="calendario.php" class="button float-right">Ver todos</a>
                                    </div> <!--#talleres-->
                                  <?php endif; ?>
                                <?php $i++; ?>
                                <?php endforeach; ?>
                                <?php $resultado->free(); ?>
                          <?php  } while ($conn->more_results() && $conn->next_result());?>



                    </div> <!--.programa-evento-->
                </div> <!--.contenedor-->
            </div><!--.contenido-programa-->
        </section> <!--.programa-->


          <?php include_once 'includes/templates/invitados.php'; ?>


        <div class="contador parallax">
            <div class="contenedor">
                <ul class="resumen-evento clearfix">
                    <li><p class="numero">0</p> Tutores</li>
                    <li><p class="numero">0</p> Cursos</li>
                    <li><p class="numero">0</p> Seminarios</li>
                    <li><p class="numero">0</p> Conferencias</li>
                </ul>
            </div>
        </div>

        <section class="precios seccion">
            <h2>Precios</h2>
            <div class="contenedor">
                  <ul class="lista-precios clearfix">
                      <li>
                            <div class="tabla-precio">
                                <h3>Conferencia</h3>
                                <p class="numero">$800</p>
                                <ul>
                                  <li>Bocadillos Gratis</li>
                                  <li>Todas las conferencias</li>
                                  <li>Todos los talleres</li>
                                </ul>
                                <a href="http://localhost/gdlwebcamp/registro.php#Comprar" class="button hollow">Comprar</a>
                            </div>
                      </li>
                      <li>
                            <div class="tabla-precio">
                                <h3>Curso</h3>
                                <p class="numero">$1499</p>
                                <ul>
                                  <li>Bocadillos Gratis</li>
                                  <li>Todas las conferencias</li>
                                  <li>Todos los talleres</li>
                                </ul>
                                <a href="http://localhost/gdlwebcamp/registro.php#Comprar" class="button">Comprar</a>
                            </div>
                      </li>

                      <li>
                            <div class="tabla-precio">
                                <h3>Seminario</h3>
                                <p class="numero">$1100</p>
                                <ul>
                                  <li>Bocadillos Gratis</li>
                                  <li>Todas las conferencias</li>
                                  <li>Todos los talleres</li>
                                </ul>
                                <a href="http://localhost/gdlwebcamp/registro.php#Comprar" class="button hollow">Comprar</a>
                            </div>
                      </li>
                  </ul>
            </div>
        </section>

        <div style=" max-width: 1902px;">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3405.942053185687!2d-64.18669648485269!3d-31.388161281413467!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9432985cdc1f1b91%3A0xe3237650b6846c7f!2sMariano%20Fragueiro%202389%2C%20C%C3%B3rdoba!5e0!3m2!1ses-419!2sar!4v1605656024411!5m2!1ses-419!2sar" width="100%" height="420" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>

        <section class="seccion">
            <h2>Testimoniales</h2>
            <div class="testimoniales contenedor clearfix">
                <div class="testimonial">
                    <blockquote>
                      <p>Sed mollis velit sit amet felis condimentum ultrices. Fusce vehicula ut sem vitae semper. Nullam blandit neque eu semper ullamcorper. Duis commodo quam in orci condimentum ultricies.<p>
                      <footer class="info-testimonial clearfix">
                          <img src="img/testimonial.jpg" alt="imagen testimonial">
                          <cite>Oswaldo Aponte Escobedo <span>Diseñador en @prisma</span></cite>
                      </footer>
                    </blockquote>
                </div><!--.testimonial-->
                <div class="testimonial">
                    <blockquote>
                      <p>Sed mollis velit sit amet felis condimentum ultrices. Fusce vehicula ut sem vitae semper. Nullam blandit neque eu semper ullamcorper. Duis commodo quam in orci condimentum ultricies.<p>
                      <footer class="info-testimonial clearfix">
                          <img src="img/testimonial.jpg" alt="imagen testimonial">
                          <cite>Oswaldo Aponte Escobedo <span>Diseñador en @prisma</span></cite>
                      </footer>
                    </blockquote>
                </div><!--.testimonial-->
                <div class="testimonial">
                    <blockquote>
                      <p>Sed mollis velit sit amet felis condimentum ultrices. Fusce vehicula ut sem vitae semper. Nullam blandit neque eu semper ullamcorper. Duis commodo quam in orci condimentum ultricies.<p>
                      <footer class="info-testimonial clearfix">
                          <img src="img/testimonial.jpg" alt="imagen testimonial">
                          <cite>Oswaldo Aponte Escobedo <span>Diseñador en @prisma</span></cite>
                      </footer>
                    </blockquote>
                </div><!--.testimonial-->
            </div>
        </section>

        <div class="newsletter parallax">
            <div class="contenido contenedor">
                <p> regístrate al newsletter:</p>
                <h3>Counseling Cba</h3>
                <a href="#mc_embed_signup" class="boton_newsletter button transparente">Registro</a>
            </div> <!--.contenido-->
        </div><!--.newsletter-->

        <section class="seccion">
            <h2>Proximo evento en</h2>
            <div class="cuenta-regresiva contenedor">
                <ul class="clearfix">
                    <li><p id="dias" class="numero"></p> días</li>
                    <li><p id="horas" class="numero"></p> horas</li>
                    <li><p id="minutos" class="numero"></p> minutos</li>
                    <li><p id="segundos" class="numero"></p> segundos</li>
                </ul>
            </div>
        </section>
  <?php include_once 'includes/templates/footer.php'; ?>
