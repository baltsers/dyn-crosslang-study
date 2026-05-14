/*














 */

package net.openhft.affinity;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

enum BootClassPath {
    INSTANCE;

    private final Set<String> bootClassPathResources = Collections.unmodifiableSet(getResourcesOnBootClasspath());

    private static Set<String> getResourcesOnBootClasspath() {
        final Logger logger = LoggerFactory.getLogger(BootClassPath.class);
        final Set<String> resources = new HashSet<>();
        final String bootClassPath = System.getProperty("sun.boot.class.path", "");


        final String pathSeparator = System.getProperty("path.separator");


        final String[] pathElements = bootClassPath.split(pathSeparator);

        for (final String pathElement : pathElements) {
            resources.addAll(findResources(Paths.get(pathElement), logger));
        }

        return resources;
    }

    private static Set<String> findResources(final Path path, final Logger logger) {








        return findResourcesInJar(path, logger);
    }

    private static Set<String> findResourcesInJar(final Path path, final Logger logger) {
        final Set<String> jarResources = new HashSet<>();
        try {
            final JarFile jarFile = new JarFile(path.toFile());
            final Enumeration<JarEntry> entries = jarFile.entries();
            while (entries.hasMoreElements()) {
                final JarEntry jarEntry = entries.nextElement();
                if (jarEntry.getName().endsWith(".class")) {
                    jarResources.add(jarEntry.getName());
                }
            }
        } catch (IOException e) {

        }

        return jarResources;
    }

    private static Set<String> findResourcesInDirectory(final Path path, final Logger logger) {
        final Set<String> dirResources = new HashSet<>();
        try {
            Files.walkFileTree(path, new SimpleFileVisitor<Path>() {

                public FileVisitResult visitFile(final Path file, final BasicFileAttributes attrs) throws IOException {



                    return super.visitFile(file, attrs);
                }
            });
        } catch (IOException e) {

        }

        return dirResources;
    }

    public final boolean has(String binaryClassName) {
        final String resourceClassName = binaryClassName.replace('.', '/').concat(".class");
        return bootClassPathResources.contains(resourceClassName);
    }
}
