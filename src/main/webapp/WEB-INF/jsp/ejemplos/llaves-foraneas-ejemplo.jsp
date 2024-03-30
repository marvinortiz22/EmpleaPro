<!-- Para los select:-->
    <label for="">tipo de documento: </label>
    <form:select path="tipoDocumento.idTipoDoc">
          <form:options items="${tiposDeDocumento}" itemValue="idTipoDoc" itemLabel="nombreDoc" />
    </form:select>
    <label for="">numero de documento: </label>
    <form:input path="numeroDoc" value=""/>


    <!-- Para imprimir llaves foraneas-->
    <td>${usuario.tipoDocumento.nombreDoc}</td>