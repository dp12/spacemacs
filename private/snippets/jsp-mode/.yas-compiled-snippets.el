;;; Compiled snippets and support files for `jsp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'jsp-mode
                     '(("cchoose" "<c:choose>\n    <c:when test=\"\\${$1}\">\n        $2\n    </c:when>\n    <c:otherwise>\n        $3\n    </c:otherwise>\n</c:choose>\n" "<c:choose>" nil nil nil nil nil nil)
                       ("cforeach" "<c:forEach var=\"item\" items=\"\\${${1:items}}\" varStatus=\"status\">\n$0\n</c:forEach>\n" "<c:forEach>" nil nil nil nil nil nil)
                       ("cif" "<c:if test=\"\\${$1}\">\n    $2\n</c:if>\n" "<c:if test=\"...\">" nil nil nil nil nil nil)
                       ("cimport" "<c:import url=\"/WEB-INF/jsp/$2\" />\n" "<c:import url=\"...\" />" nil nil nil nil nil nil)
                       ("cout.default-escapeXml.yasnippet" "<c:out value=\"$1\" default=\"$2\" escapeXml=\"false\" />\n" "<c:out value=\"...\" default=\"...\" escapeXml=\"false\" />" nil nil nil nil nil nil)
                       ("cout" "# -*- mode: snippet -*-\n# -*- mode: snippet -*-\n# -*- mode: snippet -*-\n<c:out value=\"$1\" default=\"$2\" />\n" "<c:out value=\"...\" default=\"...\" />" nil nil nil nil nil nil)
                       ("coutnoxml" "<c:out value=\"$1\" escapeXml=\"false\" />\n" "<c:out value=\"...\" escapeXml=\"false\" />" nil nil nil nil nil nil)
                       ("cout" "<c:out value=\"$1\" />\n" "<c:out value=\"...\" />" nil nil nil nil nil nil)
                       ("cparam" "<c:param name=\"$1\" value=\"$2\" />\n" "<c:param name=\"...\" value=\"...\" />" nil nil nil nil nil nil)
                       ("cset" "<c:set var=\"$1\" value=\"$2\" scope=\"$3\" />\n" "<c:set var=\"...\" value=\"...\" scope=\"...\" />" nil nil nil nil nil nil)
                       ("cset" "<c:set var=\"$1\" value=\"$2\" />\n" "<c:set var=\"...\" value=\"...\" />" nil nil nil nil nil nil)
                       ("cwhen" "<c:when test=\"\\${$1}\">\n    $2\n</c:when>\n" "<c:when test=\"...\">" nil nil nil nil nil nil)
                       ("inc" "<%@ include file=\"/WEB-INF/jsp/$1\" %>\n" "<@ include file=\"...\" />" nil nil nil nil nil nil)
                       ("jspmain" "<%@page contentType=\"text/html\" pageEncoding=\"UTF-8\"%>\n<%@ page session=\"false\" %>\n<%@ taglib uri=\"http://java.sun.com/jsp/jstl/core\" prefix=\"c\" %>\n<%@ taglib uri=\"http://java.sun.com/jsp/jstl/fmt\" prefix=\"fmt\" %>\n<!DOCTYPE html>\n<html>\n  <head>\n    <meta http-equiv=\"Content-Type\" content=\"text/html;charset=UTF-8\">\n    <title>$1</title>\n  </head>\n  <body>\n    $0\n  </body>\n</html>" "jsp main" nil nil nil nil nil nil)
                       ("tlib" "<%@ taglib prefix=\"$1\" tagdir=\"/WEB-INF/tags/$2\" %>\n$0\n" "<%@taglib ...>" nil nil nil nil nil nil)
                       ("tattr" "<%@attribute name=\"$1\" required=\"true\" %>\n$0\n" "<%@attribute>" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'jsp-mode
                     '(("function" "<#function ${1:functionName} >\n    <#if ${2:flag}?? && ${2:$(yas/substr yas-text \"[^ ]*\")}>\n        <#return \"${3:true}\">\n    <#else>\n        <#return \"${4:false}\">\n    </#if>\n</#function>\n$0" "freemarker function" nil
                        ("freemarker")
                        nil nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
