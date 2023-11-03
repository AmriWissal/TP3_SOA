<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head></head>
			<body>
				<h1> Liste des comptes </h1>
				<table border ="1">
				<tr>
					<th>code</th>
					<th>solde</th>
					<th>dateCreation</th>
				</tr>
				<xsl:for-each select="BanqueService/getComptes">
			<tr>
				<th><xsl:value-of select="code"/></th>
				<th><xsl:value-of select="solde"/></th>
				<th><xsl:value-of select="dateCreation"/></th>
			</tr>
				</xsl:for-each>
			</table>
			<xsl:variable name="totalSolde" select="sum(BanqueService/getComptes/solde)"></xsl:variable>
			<h1>Somme totale des soldes : <xsl:value-of select="$totalSolde"/></h1>
			<h1> les comptes>2000</h1>
			<table border="1">
					<xsl:for-each select="BanqueService/getComptes[substring(dateCreation,1,4 )> 2000]">
			<tr>
				<th><xsl:value-of select="code"/></th>
				<th><xsl:value-of select="solde"/></th>
				<th><xsl:value-of select="dateCreation"/></th>
			</tr>
			</xsl:for-each>
			</table>	
			<h1> la Somme totale des soldes des comptes filtrés : <xsl:value-of select="$totalSoldeFiltré"/></h1>
			<table border="1">	
			<xsl:variable name="totalSoldeFiltré" select="sum(BanqueService/getComptes[substring(dateCreation,1,4)>2000]/solde)">
			</xsl:variable>
			</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>