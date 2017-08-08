<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <link href="../css/TodosRamais.css" rel="stylesheet" />
      </head>
      <body>

        <h1  class="cabecalho">Telefones</h1>

        <xsl:for-each select="Telefones/Empresa">

          <div class="empresa">
            <h3 class="titulo">
              <xsl:value-of select="@id"/>
            </h3>

            <table border="0" >
              
              <tr>
                <th class="tituloCol"  >Nome</th>
                <th  class="tituloCol"  > Celular</th>
                <th   class="tituloCol" >Telefone</th>

              </tr>
              <xsl:for-each select="Funcionario">
                <tr>
                  <td>
                    <xsl:value-of select="Nome"/>
                  </td>
                  <td>
                    <xsl:value-of select="Tel1" />
                  </td>
                  <td>
                    <xsl:value-of select="Tel2"/>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
          </div>
          
        </xsl:for-each>


      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>