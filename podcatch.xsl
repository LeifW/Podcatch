<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>
  <xsl:param name="program"/>
  <xsl:param name="episode"/>

  <xsl:template match="opml/body">
    <xsl:choose>
      <xsl:when test="$program">
        <xsl:apply-templates select="outline[@text=$program]"/>
      </xsl:when>
      <xsl:otherwise>Programs: <xsl:apply-templates select="outline" mode="index"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="outline">
    <xsl:apply-templates select="document(@xmlUrl)"/>
  </xsl:template>

  <xsl:template match="outline" mode="index">
    <xsl:value-of select="@text"/>
    <xsl:if test="position()!=last()">, </xsl:if>
  </xsl:template>
  <xsl:template match="channel">
    <xsl:choose>
      <xsl:when test="$episode">
        <xsl:apply-templates select="item[$episode]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="item" mode="index"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="item">
    <xsl:value-of select="enclosure/@url"/>
  </xsl:template>

  <xsl:template match="item" mode="index">
    <xsl:value-of select="concat('Episode[',position(),']: ',title,' on ',pubDate)"/>
    <xsl:text>
</xsl:text>
  </xsl:template>
  <xsl:template match="text()"/>
</xsl:stylesheet>
