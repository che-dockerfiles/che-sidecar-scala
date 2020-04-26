# Copyright (c) 2019 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Red Hat, Inc. - initial API and implementation

FROM quay.io/eclipse/che-sidecar-java:11

ENV SBT_VERSION 1.3.10

RUN curl -Ls https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > /usr/local/bin/sbt && \
    chmod 0755 /usr/local/bin/sbt && \
    sbt -sbt-version $SBT_VERSION eval 1+1

ENV METALS_VERSION 0.8.4

RUN curl -Ls https://raw.githubusercontent.com/coursier/coursier/gh-pages/coursier > /usr/local/bin/coursier && \
    chmod 0755 /usr/local/bin/coursier && \
    coursier launch org.scalameta:metals_2.12:$METALS_VERSION --main scala.meta.metals.DownloadDependencies
