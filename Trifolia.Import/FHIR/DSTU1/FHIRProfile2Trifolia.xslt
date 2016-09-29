<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2016r2

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://hl7.org/fhir" xmlns:user="http://www.altova.com/MapForce/UDF/user" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="ns0 user vmf xs fn">
	<xsl:param name="TemplateExport4" select="'TemplateExport.xml'"/>
	<xsl:param name="fhir-atom-single3" select="'fhir-atom-single.xml'"/>
	<xsl:param name="fhir-atom-single4" select="'fhir-atom-single.xml'"/>
	<xsl:param name="fhir-atom-single5" select="'fhir-atom-single.xml'"/>
	<xsl:template name="user:element2constraint">
		<xsl:param name="parentFhirPath" select="()"/>
		<xsl:param name="element" select="()"/>
		<xsl:param name="children" select="()"/>
		<xsl:variable name="var6_definition" as="node()*" select="$element/ns0:definition"/>
		<ConstraintType xmlns="http://www.lantanagroup.com">
			<xsl:for-each select="($element/ns0:path)[fn:exists(@value)]">
				<xsl:variable name="var1_resultof_contextFromFhirPath" as="xs:string?">
					<xsl:call-template name="user:contextFromFhirPath">
						<xsl:with-param name="parentFHIRPath" select="$parentFhirPath" as="xs:string"/>
						<xsl:with-param name="path" select="fn:string(@value)" as="xs:string"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:if test="fn:exists($var1_resultof_contextFromFhirPath)">
					<xsl:attribute name="context" namespace="" select="$var1_resultof_contextFromFhirPath"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="$var6_definition/ns0:constraint">
				<xsl:variable name="var3_resultof_filter" as="node()*">
					<xsl:for-each select="(./ns0:severity)[fn:exists(@value)]">
						<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
							<xsl:call-template name="vmf:vmf1_inputtoresult">
								<xsl:with-param name="input" select="fn:string(@value)" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:if test="fn:exists($var2_resultof_vmf__inputtoresult)">
							<xsl:sequence select="."/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:for-each select="$var3_resultof_filter">
					<xsl:attribute name="conformance" namespace="">
						<xsl:call-template name="vmf:vmf1_inputtoresult">
							<xsl:with-param name="input" select="fn:string(@value)" as="xs:string"/>
						</xsl:call-template>
					</xsl:attribute>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$var6_definition">
				<xsl:variable name="var5_current" as="node()" select="."/>
				<xsl:for-each select="(./ns0:min)[fn:exists(@value)]">
					<xsl:variable name="var4_current" as="node()" select="."/>
					<xsl:for-each select="($var5_current/ns0:max)[fn:exists(@value)]">
						<xsl:attribute name="cardinality" namespace="" select="fn:concat(fn:concat(xs:string(xs:integer(fn:string($var4_current/@value))), '..'), fn:string(@value))"/>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
			<lcg:SingleValueCode xmlns:lcg="http://www.lantanagroup.com">
				<xsl:for-each select="($var6_definition/ns0:valueCodeableConcept/ns0:coding/ns0:code)[fn:exists(@value)]">
					<xsl:attribute name="code" namespace="" select="fn:string(@value)"/>
				</xsl:for-each>
				<xsl:for-each select="($var6_definition/ns0:valueCodeableConcept/ns0:coding/ns0:display)[fn:exists(@value)]">
					<xsl:attribute name="displayName" namespace="" select="fn:string(@value)"/>
				</xsl:for-each>
			</lcg:SingleValueCode>
			<lcg:CodeSystem xmlns:lcg="http://www.lantanagroup.com">
				<xsl:for-each select="($var6_definition/ns0:valueCodeableConcept/ns0:coding/ns0:system)[fn:exists(@value)]">
					<xsl:attribute name="oid" namespace="" select="xs:string(xs:anyURI(fn:string(@value)))"/>
				</xsl:for-each>
			</lcg:CodeSystem>
			<xsl:for-each select="($var6_definition/ns0:constraint/ns0:xpath)[fn:exists(@value)]">
				<lcg:SchematronTest xmlns:lcg="http://www.lantanagroup.com">
					<xsl:sequence select="fn:string(@value)"/>
				</lcg:SchematronTest>
			</xsl:for-each>
			<xsl:for-each select="($var6_definition/ns0:constraint/ns0:human)[fn:exists(@value)]">
				<lcg:NarrativeText xmlns:lcg="http://www.lantanagroup.com">
					<xsl:sequence select="fn:string(@value)"/>
				</lcg:NarrativeText>
			</xsl:for-each>
			<xsl:for-each select="$children">
				<lcg:Constraint xmlns:lcg="http://www.lantanagroup.com">
					<xsl:sequence select="(./@node(), ./node())"/>
				</lcg:Constraint>
			</xsl:for-each>
		</ConstraintType>
	</xsl:template>
	<xsl:template name="user:contextFromFhirPath">
		<xsl:param name="parentFHIRPath" select="()"/>
		<xsl:param name="path" select="()"/>
		<xsl:sequence select="fn:substring-after($path, fn:concat($parentFHIRPath, '.'))"/>
	</xsl:template>
	<xsl:template name="user:nestConstraints">
		<xsl:param name="parentFhirPath" select="()"/>
		<xsl:param name="element" select="()"/>
		<xsl:param name="structure" select="()"/>
		<xsl:if test="fn:exists($parentFhirPath)">
			<xsl:variable name="var25_resultof_filter" as="node()*" select="($element/ns0:path)[fn:exists(@value)]"/>
			<xsl:variable name="var23_resultof_map" as="xs:boolean*">
				<xsl:for-each select="$var25_resultof_filter">
					<xsl:variable name="var22_resultof_first" as="xs:string" select="$parentFhirPath"/>
					<xsl:variable name="var21_resultof_cast" as="xs:string" select="fn:string(@value)"/>
					<xsl:variable name="var20_resultof_contextFromFhirPath" as="xs:string?">
						<xsl:call-template name="user:contextFromFhirPath">
							<xsl:with-param name="parentFHIRPath" select="$var22_resultof_first" as="xs:string"/>
							<xsl:with-param name="path" select="$var21_resultof_cast" as="xs:string"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:if test="fn:exists($var20_resultof_contextFromFhirPath)">
						<xsl:variable name="var19_resultof_first" as="xs:string" select="$var20_resultof_contextFromFhirPath"/>
						<xsl:sequence select="((($var22_resultof_first != $var21_resultof_cast) and ('' != $var19_resultof_first)) and fn:not(fn:contains($var19_resultof_first, '.')))"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="var24_let" as="node()?">
				<xsl:if test="fn:exists(($var23_resultof_map)[.])">
					<element xmlns="http://hl7.org/fhir" xmlns:osr="http://a9.com/-/opensearch/extensions/relevance/1.0/" xmlns:os="http://a9.com/-/spec/opensearch/1.1/" xmlns:at="http://purl.org/atompub/tombstones/1.0" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:atom="http://www.w3.org/2005/Atom">
						<xsl:sequence select="$element/@node()"/>
						<xsl:sequence select="$element/node()"/>
					</element>
				</xsl:if>
			</xsl:variable>
			<xsl:for-each select="$var24_let">
				<xsl:variable name="var18_resultof_first" as="xs:string" select="$parentFhirPath"/>
				<xsl:variable name="var15_resultof_map" as="xs:boolean*">
					<xsl:for-each select="$var25_resultof_filter">
						<xsl:variable name="var14_resultof_cast" as="xs:string" select="fn:string(@value)"/>
						<xsl:variable name="var13_resultof_contextFromFhirPath" as="xs:string?">
							<xsl:call-template name="user:contextFromFhirPath">
								<xsl:with-param name="parentFHIRPath" select="$var18_resultof_first" as="xs:string"/>
								<xsl:with-param name="path" select="$var14_resultof_cast" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:if test="fn:exists($var13_resultof_contextFromFhirPath)">
							<xsl:variable name="var12_resultof_first" as="xs:string" select="$var13_resultof_contextFromFhirPath"/>
							<xsl:sequence select="((($var18_resultof_first != $var14_resultof_cast) and ('' != $var12_resultof_first)) and fn:not(fn:contains($var12_resultof_first, '.')))"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="var16_let" as="node()?">
					<xsl:if test="fn:exists(($var15_resultof_map)[.])">
						<element xmlns="http://hl7.org/fhir" xmlns:osr="http://a9.com/-/opensearch/extensions/relevance/1.0/" xmlns:os="http://a9.com/-/spec/opensearch/1.1/" xmlns:at="http://purl.org/atompub/tombstones/1.0" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:atom="http://www.w3.org/2005/Atom">
							<xsl:sequence select="$element/@node()"/>
							<xsl:sequence select="$element/node()"/>
						</element>
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="var17_resultof_element_constraint" as="node()?">
					<xsl:call-template name="user:element2constraint">
						<xsl:with-param name="parentFhirPath" select="$var18_resultof_first" as="xs:string"/>
						<xsl:with-param name="element" as="node()">
							<element xmlns="http://hl7.org/fhir">
								<xsl:sequence select="(./@node(), ./node())"/>
							</element>
						</xsl:with-param>
						<xsl:with-param name="children" as="node()*">
							<xsl:for-each select="$var16_let/ns0:path">
								<xsl:variable name="var11_current" as="node()" select="."/>
								<xsl:variable name="var8_resultof_filter" as="node()*">
									<xsl:for-each select="$structure/ns0:element">
										<xsl:variable name="var7_value" as="node()?" select="$var11_current/@value"/>
										<xsl:variable name="var6_result" as="xs:boolean*">
											<xsl:if test="fn:exists($var7_value)">
												<xsl:for-each select="(./ns0:path)[fn:exists(@value)]">
													<xsl:variable name="var4_resultof_cast" as="xs:string" select="fn:string($var7_value)"/>
													<xsl:variable name="var5_resultof_cast" as="xs:string" select="fn:string(@value)"/>
													<xsl:variable name="var3_resultof_contextFromFhirPath" as="xs:string?">
														<xsl:call-template name="user:contextFromFhirPath">
															<xsl:with-param name="parentFHIRPath" select="$var4_resultof_cast" as="xs:string"/>
															<xsl:with-param name="path" select="$var5_resultof_cast" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:if test="fn:exists($var3_resultof_contextFromFhirPath)">
														<xsl:variable name="var2_resultof_first" as="xs:string" select="$var3_resultof_contextFromFhirPath"/>
														<xsl:sequence select="((($var4_resultof_cast != $var5_resultof_cast) and ('' != $var2_resultof_first)) and fn:not(fn:contains($var2_resultof_first, '.')))"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
										</xsl:variable>
										<xsl:if test="fn:exists(($var6_result)[.])">
											<xsl:sequence select="."/>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<xsl:for-each select="$var8_resultof_filter">
									<xsl:variable name="var10_value" as="node()?" select="$var11_current/@value"/>
									<xsl:variable name="var9_resultof_nestConstraints" as="node()*">
										<xsl:call-template name="user:nestConstraints">
											<xsl:with-param name="parentFhirPath" as="xs:string?">
												<xsl:if test="fn:exists($var10_value)">
													<xsl:sequence select="fn:string($var10_value)"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="element" as="node()">
												<element xmlns="http://hl7.org/fhir">
													<xsl:sequence select="(./@node(), ./node())"/>
												</element>
											</xsl:with-param>
											<xsl:with-param name="structure" as="node()">
												<structure xmlns="http://hl7.org/fhir">
													<xsl:sequence select="($structure/@node(), $structure/node())"/>
												</structure>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:for-each select="$var9_resultof_nestConstraints">
										<ConstraintType xmlns="http://www.lantanagroup.com">
											<xsl:sequence select="(./@node(), ./node())"/>
										</ConstraintType>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:if test="fn:exists($var17_resultof_element_constraint)">
					<xsl:variable name="var1_resultof_first" as="node()" select="$var17_resultof_element_constraint"/>
					<Constraint xmlns="http://www.lantanagroup.com">
						<xsl:sequence select="($var1_resultof_first/@node(), $var1_resultof_first/node())"/>
					</Constraint>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='error'">
				<xsl:copy-of select="'SHALL'"/>
			</xsl:when>
			<xsl:when test="$input='warning'">
				<xsl:copy-of select="'SHOULD'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:param name="implementationGuideName" as="xs:string?" select="()"/>
	<xsl:param name="implementationGuideVersion" as="xs:integer?" select="()"/>
	<xsl:param name="implementationGuideTypeName" as="xs:string?" select="()"/>
	<xsl:template match="/">
		<Trifolia xmlns="http://www.lantanagroup.com">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'http://www.lantanagroup.com file:///C:/Users/Sean/Documents/Lantana/Code/Trifolia-OS/Trifolia.Shared/ImportExport/Model/TemplateExport.xsd'"/>
			<xsl:for-each select="atom:feed/atom:entry">
				<xsl:variable name="var7_current" as="node()" select="."/>
				<xsl:for-each select="atom:content/ns0:Profile">
					<xsl:variable name="var6_structure" as="node()*" select="ns0:structure"/>
					<xsl:variable name="var5_value" as="node()?" select="ns0:name/@value"/>
					<xsl:variable name="var4_resultof_filter" as="node()*" select="($var6_structure)[fn:exists(ns0:type/@value)]"/>
					<Template>
						<xsl:for-each select="$var7_current/atom:id">
							<xsl:attribute name="identifier" namespace="" select="xs:string(xs:anyURI(fn:string(.)))"/>
						</xsl:for-each>
						<xsl:attribute name="implementationGuideType" namespace="">
							<xsl:choose>
								<xsl:when test="fn:exists($implementationGuideTypeName)">
									<xsl:sequence select="$implementationGuideTypeName"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:sequence select="'FHIR DSTU1'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:for-each select="$var4_resultof_filter">
							<xsl:attribute name="templateType" namespace="" select="fn:string(ns0:type/@value)"/>
						</xsl:for-each>
						<xsl:if test="fn:exists($var5_value)">
							<xsl:attribute name="title" namespace="" select="fn:string($var5_value)"/>
						</xsl:if>
						<xsl:attribute name="bookmark" namespace="" select="generate-id(.)"/>
						<xsl:for-each select="$var4_resultof_filter">
							<xsl:attribute name="context" namespace="" select="fn:string(ns0:type/@value)"/>
						</xsl:for-each>
						<xsl:for-each select="$var4_resultof_filter">
							<xsl:attribute name="contextType" namespace="" select="fn:string(ns0:type/@value)"/>
						</xsl:for-each>
						<xsl:attribute name="isOpen" namespace="" select="xs:string(fn:false())"/>
						<ImplementationGuide>
							<xsl:attribute name="name" namespace="">
								<xsl:choose>
									<xsl:when test="fn:exists($implementationGuideName)">
										<xsl:sequence select="$implementationGuideName"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:sequence select="'Unowned FHIR DSTU1 Profiles'"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:if test="fn:exists($implementationGuideVersion)">
								<xsl:attribute name="version" namespace="" select="xs:string($implementationGuideVersion)"/>
							</xsl:if>
						</ImplementationGuide>
						<xsl:for-each select="$var6_structure">
							<xsl:variable name="var3_current" as="node()" select="."/>
							<xsl:for-each select="ns0:element">
								<xsl:variable name="var2_value" as="node()?" select="$var3_current/ns0:type/@value"/>
								<xsl:variable name="var1_resultof_nestConstraints" as="node()*">
									<xsl:call-template name="user:nestConstraints">
										<xsl:with-param name="parentFhirPath" as="xs:string?">
											<xsl:if test="fn:exists($var2_value)">
												<xsl:sequence select="fn:string($var2_value)"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="element" as="node()">
											<element xmlns="http://hl7.org/fhir">
												<xsl:sequence select="(./@node(), ./node())"/>
											</element>
										</xsl:with-param>
										<xsl:with-param name="structure" as="node()">
											<structure xmlns="http://hl7.org/fhir">
												<xsl:sequence select="($var3_current/@node(), $var3_current/node())"/>
											</structure>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var1_resultof_nestConstraints">
									<Constraint>
										<xsl:sequence select="(./@node(), ./node())"/>
									</Constraint>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</Template>
				</xsl:for-each>
			</xsl:for-each>
		</Trifolia>
	</xsl:template>
</xsl:stylesheet>