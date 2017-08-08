<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <link href="../css/XSL-Style.css" rel="stylesheet" />
        
      </head>
      <body>

        <h1  class="cabecalho">Ramais</h1>

        <xsl:for-each select="Ramais/Empresa">

          <div class="empresa">
             <h3 class="titulo-fixed-width">
            <xsl:value-of select="@id"/>
          </h3>
            
            <xsl:for-each select="Departamento">
              <div class="departamento">
                <table border="0" >
                  <tr>
                    <th colspan="4">
                      <div class="titulo">
                        <xsl:value-of select="@id"/>
                      </div>
                    </th>
                  </tr>

                  <tr>
                    <th class="tituloCol"  >Nome</th>
                    <th  class="tituloCol"  >Ramal</th>
                    <th   class="tituloCol" >Sigla</th>
                    <th  class="tituloCol"  >Local</th>
                  </tr>
                  <xsl:for-each select="Funcionario">
                    <tr>
                      <td>
                        <xsl:value-of select="Nome"/>
                      </td>
                      <td class="centralizaTexto">
                        <xsl:value-of select="Ramal" />
                      </td>
                      <td>
                        <xsl:value-of select="Sigla"/>
                      </td>
                      <td class="centralizaTexto">
                        <xsl:value-of select="Local"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
              </div>
            </xsl:for-each>
          
          </div>
        
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>