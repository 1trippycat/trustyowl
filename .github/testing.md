# Testing Vue.js Applications with Vite

## General Principles


-- **BEFORE YOU DO ANYTHING** understand what you are testing.  make sure your tests match the test subject/function/method/etc.
- **Component-Level Testing**: Focus on testing Vue components in isolation.
- **Test User Interactions**: Verify components respond correctly to user events.
- **Mock External Dependencies**: Use dependency injection and mocking for API calls.
- **Test Reactivity**: Ensure reactive properties and computed values update correctly.

## Setup Requirements

### For Vue 3 + Vite Projects

1. **Install Testing Dependencies**:
   ```bash
   # For Vue Test Utils + Vitest (recommended for Vite projects)
   npm install -D vitest @vue/test-utils happy-dom @testing-library/vue
   
   # Optional additions
   npm install -D @testing-library/user-event jsdom
   ```

2. **Configure Vitest in vite.config.ts**:
   ```typescript
   /// <reference types="vitest" />
   import { defineConfig } from 'vite'
   import vue from '@vitejs/plugin-vue'
   
   export default defineConfig({
     plugins: [vue()],
     test: {
       globals: true,
       environment: 'happy-dom', // or 'jsdom'
       setupFiles: ['./src/test/setup.ts'],
       css: true,
       coverage: {
         provider: 'istanbul',
         reporter: ['text', 'json', 'html'],
         exclude: ['node_modules/', 'src/test/']
       }
     }
   })
   ```

3. **Create Test Setup File**:
   ```typescript
   // src/test/setup.ts
   import '@testing-library/jest-dom'
   
   // Global mocks and configurations
   vi.mock('vue-router', () => ({
     useRouter: () => ({
       push: vi.fn(),
       replace: vi.fn()
     }),
     useRoute: () => ({
       params: {},
       query: {}
     })
   }))
   ```

4. **Configure TypeScript for Vitest** (tsconfig.json):
   ```json
   {
     "compilerOptions": {
       "types": ["vitest/globals"]
     }
   }
   ```

## Component Testing

### Using Vue Test Utils

```typescript
import { mount } from '@vue/test-utils'
import { describe, it, expect, beforeEach, vi } from 'vitest'
import MyComponent from '../MyComponent.vue'
import { createPinia } from 'pinia'

describe('MyComponent', () => {
  let wrapper;
  
  beforeEach(() => {
    const pinia = createPinia()
    
    wrapper = mount(MyComponent, {
      global: {
        plugins: [pinia],
        stubs: {
          // Stub child components if needed
          'router-link': true,
        },
        mocks: {
          // Mock global properties
          $t: (key: string) => key
        }
      },
      props: {
        title: 'Test Title'
      }
    })
  })
  
  it('renders correctly', () => {
    expect(wrapper.find('h1').text()).toBe('Test Title')
  })
  
  it('emits event on button click', async () => {
    await wrapper.find('button').trigger('click')
    expect(wrapper.emitted('submit')).toBeTruthy()
  })
})
```

### Using Testing Library

```typescript
import { render, screen, fireEvent } from '@testing-library/vue'
import { describe, it, expect, vi } from 'vitest'
import MyComponent from '../MyComponent.vue'
import { createTestingPinia } from '@pinia/testing'

describe('MyComponent', () => {
  it('renders correctly and responds to user interaction', async () => {
    // Arrange
    const { emitted } = render(MyComponent, {
      props: { title: 'Test Title' },
      global: {
        plugins: [
          createTestingPinia({
            createSpy: vi.fn
          })
        ]
      }
    })
    
    // Assert initial state
    expect(screen.getByText('Test Title')).toBeInTheDocument()
    
    // Act
    await fireEvent.click(screen.getByRole('button', { name: /submit/i }))
    
    // Assert after interaction
    expect(emitted()).toHaveProperty('submit')
  })
})
```

## Testing Composition API

### Testing Composables

```typescript
import { describe, it, expect } from 'vitest'
import { useCounter } from '../composables/useCounter'
import { ref } from 'vue'

describe('useCounter', () => {
  it('increments counter', () => {
    // Arrange
    const { count, increment } = useCounter()
    
    // Act
    increment()
    
    // Assert
    expect(count.value).toBe(1)
  })
  
  it('allows initial value', () => {
    // Arrange
    const { count } = useCounter(10)
    
    // Assert
    expect(count.value).toBe(10)
  })
})
```

## Mocking API Calls

### Using vi.mock for Axios

```typescript
import { describe, it, expect, vi, beforeEach } from 'vitest'
import { useUserApi } from '../services/userApi'

// Mock the entire axios module
vi.mock('axios', () => ({
  default: {
    get: vi.fn(),
    post: vi.fn()
  }
}))

describe('useUserApi', () => {
  beforeEach(() => {
    vi.resetAllMocks()
  })
  
  it('fetches user data successfully', async () => {
    // Arrange
    const mockUser = { id: 1, name: 'Test User' }
    const axios = await import('axios')
    axios.default.get.mockResolvedValueOnce({ data: mockUser })
    
    // Act
    const { fetchUser } = useUserApi()
    const result = await fetchUser(1)
    
    // Assert
    expect(axios.default.get).toHaveBeenCalledWith('/api/users/1')
    expect(result).toEqual(mockUser)
  })
  
  it('handles fetch error', async () => {
    // Arrange
    const axios = await import('axios')
    axios.default.get.mockRejectedValueOnce(new Error('API Error'))
    
    // Act & Assert
    const { fetchUser } = useUserApi()
    await expect(fetchUser(1)).rejects.toThrow('API Error')
  })
})
```

### Using MSW (Mock Service Worker)

```typescript
import { describe, it, expect, beforeAll, afterAll } from 'vitest'
import { setupServer } from 'msw/node'
import { rest } from 'msw'
import { useUserApi } from '../services/userApi'

const server = setupServer(
  rest.get('/api/users/:id', (req, res, ctx) => {
    const { id } = req.params
    return res(
      ctx.json({ id: Number(id), name: `User ${id}` })
    )
  })
)

beforeAll(() => server.listen())
afterAll(() => server.close())

describe('useUserApi with MSW', () => {
  it('fetches user data from API', async () => {
    // Act
    const { fetchUser } = useUserApi()
    const result = await fetchUser(1)
    
    // Assert
    expect(result).toEqual({ id: 1, name: 'User 1' })
  })
})
```

## Testing Stores (Pinia)

### Basic Store Testing

```typescript
import { setActivePinia, createPinia } from 'pinia'
import { useUserStore } from '../stores/user'
import { describe, it, expect, beforeEach, vi } from 'vitest'

// Mock API service
vi.mock('../services/api', () => ({
  fetchUser: vi.fn(() => Promise.resolve({ id: 1, name: 'Test User' }))
}))

describe('User Store', () => {
  beforeEach(() => {
    // Create a fresh pinia instance for each test
    setActivePinia(createPinia())
  })
  
  it('loads user details', async () => {
    // Arrange
    const store = useUserStore()
    
    // Act
    await store.fetchUser(1)
    
    // Assert
    expect(store.user).toEqual({ id: 1, name: 'Test User' })
    expect(store.isLoggedIn).toBe(true)
  })
})
```

### Using @pinia/testing

```typescript
import { describe, it, expect, beforeEach } from 'vitest'
import { setActivePinia, createPinia } from 'pinia'
import { createTestingPinia } from '@pinia/testing'
import { useUserStore } from '../stores/user'

describe('User Store with @pinia/testing', () => {
  it('mocks actions with testing pinia', async () => {
    // Arrange - create a testing pinia instance
    const wrapper = mount(UserProfile, {
      global: {
        plugins: [
          createTestingPinia({
            initialState: {
              user: { user: { id: 1, name: 'Initial User' } }
            }
          })
        ]
      }
    })
    
    // Get access to the mocked store
    const store = useUserStore()
    
    // Assert initial state
    expect(store.user.name).toBe('Initial User')
    
    // Act - the actual implementation won't run, it's mocked
    await store.fetchUser(2)
    
    // Assert - action was called, but state wasn't changed by mock
    expect(store.fetchUser).toHaveBeenCalledWith(2)
  })
})
```

## Testing Router Integration

```typescript
import { describe, it, expect, vi } from 'vitest'
import { mount } from '@vue/test-utils'
import { createRouter, createWebHistory } from 'vue-router'
import App from '../App.vue'
import Home from '../views/Home.vue'
import About from '../views/About.vue'

describe('Router Integration', () => {
  it('navigates between routes', async () => {
    // Arrange - create a real router instance
    const router = createRouter({
      history: createWebHistory(),
      routes: [
        { path: '/', component: Home },
        { path: '/about', component: About }
      ]
    })
    
    // Wait until router is ready
    await router.push('/')
    await router.isReady()
    
    // Mount the component with actual router
    const wrapper = mount(App, {
      global: {
        plugins: [router]
      }
    })
    
    // Assert initial route
    expect(wrapper.html()).toContain('Home')
    
    // Act - navigate to different route
    await router.push('/about')
    
    // Assert new route
    expect(wrapper.html()).toContain('About')
  })
})
```

## Testing Async Components

```typescript
import { describe, it, expect, vi } from 'vitest'
import { flushPromises } from '@vue/test-utils'
import { render, screen } from '@testing-library/vue'
import AsyncComponent from '../AsyncComponent.vue'

describe('AsyncComponent', () => {
  it('shows loading state and then data', async () => {
    // Arrange - mock API call
    vi.mock('../api', () => ({
      fetchData: vi.fn(() => Promise.resolve({ message: 'Data loaded' }))
    }))
    
    // Act - render component with async behavior
    render(AsyncComponent)
    
    // Assert - initially shows loading
    expect(screen.getByText(/loading/i)).toBeInTheDocument()
    
    // Wait for async operations to complete
    await flushPromises()
    
    // Assert - shows loaded data
    expect(screen.getByText('Data loaded')).toBeInTheDocument()
    expect(screen.queryByText(/loading/i)).not.toBeInTheDocument()
  })
})
```

## Testing Tailwind CSS Components

```typescript
import { describe, it, expect } from 'vitest'
import { render } from '@testing-library/vue'
import Button from '../components/Button.vue'

describe('Button Component with Tailwind Classes', () => {
  it('applies correct Tailwind classes based on props', () => {
    // Arrange & Act
    const { container } = render(Button, {
      props: {
        variant: 'primary',
        size: 'lg'
      },
      slots: {
        default: 'Click me'
      }
    })
    
    const button = container.querySelector('button')
    
    // Assert - check computed classes
    expect(button).toHaveClass('bg-primary')
    expect(button).toHaveClass('text-white')
    expect(button).toHaveClass('px-6') // large button padding
    expect(button).toHaveClass('py-3') // large button padding
    expect(button).toHaveTextContent('Click me')
  })
})
```

## Snapshot Testing

```typescript
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import BaseCard from '../components/BaseCard.vue'

describe('BaseCard', () => {
  it('matches snapshot', () => {
    const wrapper = mount(BaseCard, {
      props: {
        title: 'Card Title'
      },
      slots: {
        default: '<p>Card content</p>'
      }
    })
    
    expect(wrapper.html()).toMatchSnapshot()
  })
})
```

## Common Issues & Solutions

1. **Component Not Rendering in Tests**:
   - Cause: Missing required props or global components
   - Solution: Provide all required props and stub or mock global components

2. **Composition API Reactivity Not Working in Tests**:
   - Cause: Not flushing promises or Vue's reactivity system
   - Solution: Use `await nextTick()` or `flushPromises()` after changes

3. **Tailwind Classes Not Applied in Tests**:
   - Cause: CSS processing is often disabled in test environments
   - Solution: Test for class names rather than actual styles

4. **Router or Pinia Missing in Components**:
   - Cause: Not providing necessary plugins to test environment
   - Solution: Use the global.plugins option in Vue Test Utils

5. **Mock Functions Not Being Called**:
   - Cause: Incorrect mock implementation or component behavior
   - Solution: Use `vi.spyOn()` to verify function calls or check mock function properties

## Testing in Docker

1. **Configure Vitest for CI Mode**:
   ```typescript
   // vitest.config.ts
   export default defineConfig({
     test: {
       environment: 'happy-dom',
       coverage: {
         reporter: ['text', 'json', 'html'],
         reportsDirectory: './coverage'
       }
     }
   })
   ```

2. **Add Testing Command to Dockerfile**:
   ```dockerfile
   FROM node:18-alpine AS build
   
   WORKDIR /app
   
   COPY package*.json ./
   RUN npm ci
   
   COPY . .
   
   # Run tests
   RUN npm run test:ci
   
   # Continue with build if tests pass
   RUN npm run build
   ```

3. **Configure CI-specific Test Script in package.json**:
   ```json
   {
     "scripts": {
       "test": "vitest",
       "test:ci": "vitest run --coverage"
     }
   }
   ```

## Best Practices for Vue Component Testing

1. **Test props validation and defaults**
2. **Test slots and their rendering**
3. **Test events emitted by components**
4. **Test component lifecycle hooks (if applicable)**
5. **Test computed properties and watchers**
6. **Test conditional rendering in components**
7. **Use data-testid attributes for component selection**
8. **Focus on behavior over implementation**
9. **Create test factory functions for common component setups**
10. **Test accessibility concerns with axe or similar tools**