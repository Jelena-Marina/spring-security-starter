// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package spring.security.starter.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import spring.security.starter.model.Todo;

privileged aspect Todo_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Todo.entityManager;
    
    public static final EntityManager Todo.entityManager() {
        EntityManager em = new Todo().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Todo.countTodoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Todo o", Long.class).getSingleResult();
    }
    
    public static List<Todo> Todo.findAllTodoes() {
        return entityManager().createQuery("SELECT o FROM Todo o", Todo.class).getResultList();
    }
    
    public static Todo Todo.findTodo(Long id) {
        if (id == null) return null;
        return entityManager().find(Todo.class, id);
    }
    
    public static List<Todo> Todo.findTodoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Todo o", Todo.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Todo.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Todo.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Todo attached = Todo.findTodo(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Todo.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Todo.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Todo Todo.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Todo merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
