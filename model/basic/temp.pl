# HACK pour modifier l'apparence de la page html de l'exercice

style.temp == #|css|
<style>

.exercise__header{
  padding-top: 0.5em;
  padding-bottom: 0.5em;
}

.exercise__instructions{
  display: none;
}

.exercise__body{
  padding-top: 0.5em;
  padding-bottom: 0.5em;
}

.exercise__title {
   font-size: 20px;
}

.exercise__actions .btn-group {
   float: left;
}

.action-save {
   display: none;
}
.action-reset {
   display: none;
}
.action-next {
   display: none;
}
.action-download-env {
   display: none;
}
</style>
==